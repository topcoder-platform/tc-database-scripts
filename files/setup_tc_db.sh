#!/bin/bash
#
#  name:        setup_tc_db.sh:
#  description: Initialize Informix database and populate it with TopCoder data
#

set -o pipefail

function myfatal {
	if [ "${1}" -ne 0 ] ; then
		echo "${2}" >&2
		exit $1
	fi
}

export DB_LOCALE="en_us.utf8"
export CLIENT_LOCALE="en_us.utf8"

export INFORMIX_HOME="/home/informix/"
INFORMIX_HOME="${INFORMIX_HOME%/}" # Strip the trailing / (if exists)

export INFORMIX_DATA_DIR="${INFORMIX_HOME}/tcdata/"
INFORMIX_DATA_DIR="${INFORMIX_DATA_DIR%/}"

source "${INFORMIX_HOME}/.bashrc"
source "${INFORMIX_HOME}/ifx_informixoltp_tcp.env"

echo ">>>    Update sqlhost ..."
sudo echo "${INFORMIXSERVER}        onsoctcp        ${HOSTNAME}               sqlexec" > "${INFORMIXSQLHOSTS}"
sudo echo "${INFORMIXSERVER}_dr        drsoctcp        ${HOSTNAME}               sqlexec_dr" >> "${INFORMIXSQLHOSTS}"
sudo chown informix: $INFORMIXSQLHOSTS
sudo chmod 744 $INFORMIXSQLHOSTS

sed -i 's/.*database.server.*/'database.server=$HOSTNAME/ $INFORMIX_HOME/tc-database-scripts/build.properties

if [ ! -e "${INFORMIX_DATA_DIR}/.initialized" ] ; then
    sudo cp /sdk_license.tar $INFORMIXDIR/sdk_license
    cd $INFORMIXDIR/sdk_license
    sudo tar xvf sdk_license.tar
    cd ${INSTALL_DIR}/etc
	echo ">>>    Create data directory structure in ${INFORMIX_DATA_DIR} (ifx initialization)"
	mkdir -p "${INFORMIX_DATA_DIR}"/logs
	mkdir -p "${INFORMIX_DATA_DIR}"/backup/datas
	mkdir -p "${INFORMIX_DATA_DIR}"/backup/logs
	mkdir -p "${INFORMIX_DATA_DIR}"/spaces/
	touch "${INFORMIX_DATA_DIR}"/spaces/rootdbs.000
	touch "${INFORMIX_DATA_DIR}"/spaces/datadbs.000

	chown -R informix: "${INFORMIX_DATA_DIR}"/logs
	chown -R informix: "${INFORMIX_DATA_DIR}"/backup
	chown -R informix: "${INFORMIX_DATA_DIR}"/spaces
	chmod 660 "${INFORMIX_DATA_DIR}"/spaces/rootdbs.000
	chmod 660 "${INFORMIX_DATA_DIR}"/spaces/datadbs.000
	chmod -R 777 "${INFORMIX_DATA_DIR}"/backup
	
	# Initialize shared memmory and data structure
	# and kill server
	oninit -ivy && touch "${INFORMIX_DATA_DIR}/.initialized"	
	ONLINE_LOG="${INFORMIX_DATA_DIR}/logs/online.log"
    echo 'oninit starting'
    iter=0
    while [ ${iter} -lt 240 ]; do
        grep -i "sysadmin" ${ONLINE_LOG} 2>&1 1>/dev/null
		echo $iter
        if [ $? -eq 0 ]; then break; fi
        iter=$((iter+1));
        sleep 1;
    done
    if [ ${iter} -lt 240 ];then
        echo 'oninit complete'
    else
        myfatal 1 "Problem creating sysadmin with oninit"
    fi
    onspaces -c -d datadbs -p "${INFORMIX_DATA_DIR}"/spaces/datadbs.000 -o 0 -s 204800
	/opt/apache-ant-1.9.8/bin/ant -f "${INFORMIX_HOME}"/tc-database-scripts/build.xml reinstall_db
	onmode -ky
fi
