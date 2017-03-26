#!/bin/bash
#
#  name:        informix_stop.sh:
#  description: Stops Informix in Docker container
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

echo ">>> Stopping the listeners..."
INFORMIXDIR=/opt/IBM/informix
INSTALL_DIR=$INFORMIXDIR

#CLASSPATH="${INSTALL_DIR}/bin/jsonListener.jar:${INSTALL_DIR}/bin/tomcat-embed-core.jar"

#java -cp "$CLASSPATH" com.ibm.nosql.server.ListenerCLI -config ${INSTALL_DIR}/etc/json_mongo.properties -stop
#java -cp "$CLASSPATH" com.ibm.nosql.server.ListenerCLI -config ${INSTALL_DIR}/etc/json_rest.properties -stop

#java -jar "$INFORMIXDIR"/bin/jsonListener.jar     \
# -config ${INSTALL_DIR}/etc/json_rest.properties  \
# -config ${INSTALL_DIR}/etc/json_mongo.properties \
# -config ${INSTALL_DIR}/etc/json_mqtt.properties  \
# -stop

source "${INFORMIX_HOME}/.bashrc"
source "${INFORMIX_HOME}/ifx_informixoltp_tcp.env"

echo ">>>    Stopping the IBM Informix Database (${INFORMIXSERVER}) ... "

onmode -kuy
## -k   Shutdown completely
## -u   Change to quiescent mode and kill all attached sessions
## -y   Do not require confirmation
myfatal $? "*** Shutdown of ${INFORMIXSERVER} FAILED***"
echo "*** Shutdown of ${INFORMIXSERVER} SUCCESS ***"
