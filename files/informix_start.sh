#!/bin/bash
#
#  name:        informix_start.sh:
#  description: Starts Informix in Docker container
#

set -o pipefail

function myfatal {
	if [ "${1}" -ne 0 ] ; then
		echo "${2}" >&2
		exit $1
	fi
}

export INFORMIX_HOME="/home/informix/"
INFORMIX_HOME="${INFORMIX_HOME%/}" # Strip the trailing / (if exists)

export INFORMIX_DATA_DIR="${INFORMIX_HOME}/tcdata/"
INFORMIX_DATA_DIR="${INFORMIX_DATA_DIR%/}"

export MYINFORMIX_DBSPACE="rootdbs"

source "${INFORMIX_HOME}/.bashrc"
source "${INFORMIX_HOME}/ifx_informixoltp_tcp.env"

export HOSTNAME=${HOSTNAME:-`hostname`}

echo ">>>    Update sqlhost ..."
sudo echo "${INFORMIXSERVER}        onsoctcp        ${HOSTNAME}               sqlexec" > "${INFORMIXSQLHOSTS}"
sudo echo "${INFORMIXSERVER}_dr        drsoctcp        ${HOSTNAME}               sqlexec_dr" >> "${INFORMIXSQLHOSTS}"
sudo chown informix: $INFORMIXSQLHOSTS
sudo chmod 744 $INFORMIXSQLHOSTS

if [ ! -e "${INFORMIX_DATA_DIR}/.initialized" ] ; then
	echo ">>>    Create data directory structure in ${INFORMIX_DATA_DIR} (ifx initialization)"
	mkdir -p "${INFORMIX_DATA_DIR}"/logs
	mkdir -p "${INFORMIX_DATA_DIR}"/backup/datas
	mkdir -p "${INFORMIX_DATA_DIR}"/backup/logs
	mkdir -p "${INFORMIX_DATA_DIR}"/spaces/
	touch "${INFORMIX_DATA_DIR}"/spaces/rootdbs.000

	chown -R informix: "${INFORMIX_DATA_DIR}"/{logs,backup,spaces}
	chmod 660 "${INFORMIX_DATA_DIR}"/spaces/rootdbs.000
	chmod -R 777 "${INFORMIX_DATA_DIR}"/backup

	# Initialize shared memmory and data structure
	# and kill server
	oninit -ivy && touch "${INFORMIX_DATA_DIR}/.initialized"
	
	ONLINE_LOG="${INFORMIX_DATA_DIR}/logs/online.log"
	echo 'oninit starting'
	iter=0
	while [ ${iter} -lt 120 ]; do
		grep -i "sysadmin" ${ONLINE_LOG} 2>&1 1>/dev/null
		if [ $? -eq 0 ]; then break; fi
		iter=$((iter+1));
		sleep 1;
	done
	if [ ${iter} -lt 120 ];then
		echo 'oninit complete'
	else
		myfatal 1 "Problem creating sysadmin with oninit"
	fi
	
	# If extensible
	if [ -z "$ROOTSPACESIZE" ]; then
		onmode -wf SP_THRESHOLD=10
		echo "grant dba to root;" | dbaccess sysadmin -
		echo "EXECUTE FUNCTION task('modify chunk extendable', '1');" | dbaccess sysadmin -
	fi	
	onmode -ky
fi


DB_NAME=${DB_NAME:-}
DB_USER=${DB_USER:-}
DB_PASS=${DB_PASS:-}

DB_INFO_FILE="${INFORMIX_HOME}/informix_dbinfo.sh"
IFX_CREATE="NO"
## Create new user
if [ ! -e "${DB_INFO_FILE}" ] && [ ! -z "${DB_USER}" ] && [ ! -z "${DB_PASS}" ] &&  [ ! -z "${DB_NAME}" ] ; then
	IFX_CREATE="YES"
	echo -e "IFX_DB_NAME=${DB_NAME}\n"\
			"IFX_DB_USER=${DB_USER}\n"\
			"IFX_DB_PASS=${DB_PASS}\n" > "${DB_INFO_FILE}"

fi

if [ "${IFX_CREATE}" = "YES" ] ; then
	# Check if user exists: id -u "${DB_USER}"
	echo ">>>    Create user \"${DB_USER}\"..."
	sudo useradd ${USER_ADD_CREATE_HOME} -d "${INFORMIX_HOME}" "${DB_USER}"  >/dev/null
	myfatal $? "User creation failed"
	
	echo "${DB_USER}:${DB_PASS}" | sudo chpasswd
	myfatal $? "Changing password failed"
fi

echo ">>>    Starting up the IBM Informix Database (${INFORMIXSERVER}) ... "
oninit -vy
myfatal $? "*** Startup of ${INFORMIXSERVER} FAILED***"
echo "*** Startup of ${INFORMIXSERVER} SUCCESS ***"

## Create database and grant DBA
if [ "${IFX_CREATE}" = "YES" ] ; then
	echo ">>>    Create database \"${DB_NAME}\"..."
	echo "CREATE DATABASE ${DB_NAME} IN ${MYINFORMIX_DBSPACE} WITH BUFFERED LOG" | dbaccess > /dev/null 2>&1
	myfatal $? "CREATE DATABASE ${DB_NAME} FAILED"

	echo ">>>    Grant DBA to database \"${DB_NAME}\" for user \"${DB_USER}\"..."
	echo "GRANT DBA TO ${DB_USER};" | dbaccess "${DB_NAME}" > /dev/null 2>&1
	myfatal $? "GRANT DBA FAILED"
fi


if [ -e "${DB_INFO_FILE}" ] ; then 
	source "${DB_INFO_FILE}"
	onstat -V
	echo -e "\t#################################################\n"\
    	    "\t# Informix container login information:          \n"\
       	 	"\t#   database:    ${IFX_DB_NAME}                  \n"\
       	 	"\t#   user:        ${IFX_DB_USER}                  \n"\
        	"\t#   password:    ${IFX_DB_PASS}                  \n"\
        	"\t#################################################\n" 
fi

#Mongo and Rest Listeners

INSTALL_DIR=$INFORMIXDIR
cd ${INSTALL_DIR}/etc

TCP_PORT=2021
DRDA_PORT=2022
MONGO_PORT=27017
REST_PORT=27018
MQTT_PORT=27883


sudo netstat -npl | grep -E "^.*:${MONGO_PORT}.+LISTEN.*"
mongoListening=$?
sudo netstat -npl | grep -E "^.*:${REST_PORT}.+LISTEN.*"
restListening=$?
sudo netstat -npl | grep -E "^.*:${MQTT_PORT}.+LISTEN.*"
mqttListening=$?

if [[ ! -f custom_mongo.properties ]]; then
	touch custom_mongo.properties
	echo "#For more configuration options, check the jsonListener-example.properties in /opt/IBM/informix/etc" >> custom_mongo.properties
	echo "#And add them to custom_mongo.properties" >> custom_mongo.properties
fi
	cat custom_mongo.properties > json_mongo.properties
	echo "listener.type=mongo" >> json_mongo.properties
	echo "listener.port=$MONGO_PORT" >> json_mongo.properties
	echo "listener.hostName=$HOSTNAME" >> json_mongo.properties
	echo "url=jdbc:informix-sqli://${HOSTNAME}:9088/${DB_NAME:=sysmaster}:INFORMIXSERVER=${INFORMIXSERVER};USER=${DB_USER:=informix};PASSWORD=${DB_PASS:=in4mix}" >> json_mongo.properties

if [[ ! -f custom_rest.properties ]]; then
	touch custom_rest.properties
	echo "#For more configuration options, check the jsonListener-example.properties in /opt/IBM/informix/etc" >> custom_rest.properties
	echo "#And add them to custom_rest.properties" >> custom_rest.properties
fi
	cat custom_rest.properties > json_rest.properties
	echo "listener.type=rest" >> json_rest.properties
	echo "listener.port=$REST_PORT" >> json_rest.properties
	echo "listener.hostName=$HOSTNAME" >> json_rest.properties
	echo "url=jdbc:informix-sqli://${HOSTNAME}:9088/${DB_NAME:=sysmaster}:INFORMIXSERVER=${INFORMIXSERVER};USER=${DB_USER:=informix};PASSWORD=${DB_PASS:=in4mix}"  >> json_rest.properties

if [[ ! -f custom_mqtt.properties ]]; then
	touch custom_mqtt.properties
	echo "#For more configuration options, check the jsonListener-example.properties in /opt/IBM/informix/etc" >> custom_mqtt.properties
	echo "#And add them to custom_rest.properties" >> custom_mqtt.properties
fi
	cat custom_mqtt.properties > json_mqtt.properties
	echo "include=nosql.properties" >> json_mqtt.properties
	echo "listener.type=mqtt" >> json_mqtt.properties
	echo "listener.port=$MQTT_PORT" >> json_mqtt.properties
	echo "listener.hostName=$HOSTNAME" >> json_mqtt.properties
	echo "url=jdbc:informix-sqli://${HOSTNAME}:9088/${DB_NAME:=sysmaster}:INFORMIXSERVER=${INFORMIXSERVER};USER=${DB_USER:=informix};PASSWORD=${DB_PASS:=in4mix}"  >> json_mqtt.properties



if [[ "${mongoListening}" -eq 0 ]] || [[ "${restListening}" -eq 0 ]] || [[ "${mqttListening}" -eq 0 ]];
then
	myfatal 1 "${MONGO_PORT}, ${REST_PORT}, ${MQTT_PORT} Port is binded to some other service"
else

	java -jar "${INFORMIXDIR}"/bin/jsonListener.jar  \
		-config ${INSTALL_DIR}/etc/json_mongo.properties \
		-config ${INSTALL_DIR}/etc/json_rest.properties \
		-config ${INSTALL_DIR}/etc/json_mqtt.properties \
		-logFile ${INSTALL_DIR}/jsonListener_logging.log \
		-loglevel info \
		-start &
 


        echo " "
	
fi

# checking if listeners are running

MONGOANS=$(ps -aef | grep -c json_mongo.properties)
if [[ "${MONGOANS}" -eq 2 ]];
then
	sudo netstat -npl | grep ${MONGO_PORT}
	if [ $? -eq 0 ]
	then
		echo " Wire Listener Mongo Port : "${MONGO_PORT}
	fi
fi

RESTANS=$(ps -aef | grep -c json_rest.properties)
if [ "${RESTANS}" -eq 2 ]
then
	sudo netstat -npl | grep ${REST_PORT}
	if [ $? -eq 0 ]
	then
		echo " Wire Listener Rest Port : "${REST_PORT}
	fi
fi	

MQTTANS=$(ps -aef | grep -c json_mqtt.properties)
if [ "${MQTTANS}" -eq 2 ]
then
	sudo netstat -npl | grep ${MQTT_PORT}
	if [ $? -eq 0 ]
	then
		echo " Wire Listener MQTT Port : "${MQTT_PORT}
	fi
fi	



# run interactive shell now it is done in Dockerfile
echo ">>>    Type exit to quit the Startup Shell"
echo ">>>       This will stop the container" 
echo ""
echo ">>>    For interactive shell run:"
echo ">>>      docker exec -it ${HOSTNAME} bash"
echo ""
echo ">>>    To start the container run:"
echo ">>>      docker start ${HOSTNAME} "
echo ""
echo ">>>    To safely shutdown the container run:"
echo ">>>      docker stop ${HOSTNAME} "
echo ""

#trap "/bin/bash /informix_stop.sh; exit $?" SIGHUP SIGINT SIGTERM SIGKILL
#while [ 1 ]; do sleep 1; done
#bash /informix_stop.sh
sed -i 's/.*database.server.*/'database.server=$HOSTNAME/ $INFORMIX_HOME/tc-database-scripts/build.properties
bash
bash /informix_stop.sh
