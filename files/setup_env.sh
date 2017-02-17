#!/bin/bash
#
#  name:        setup_env.sh:
#  description: Change password based on value from build.properties
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

source "${INFORMIX_HOME}/.bashrc"
source "${INFORMIX_HOME}/ifx_informixoltp_tcp.env"

function prop {
    grep "${1}" $INFORMIX_HOME/tc-database-scripts/build.properties |cut -d'=' -f2
}
echo ">>>    Update password ..."
DB_USERNAME=$(prop "database.username")
DB_PASSWORD=$(prop "database.password")
DB_ACCOUNT=$DB_USERNAME:$DB_PASSWORD
echo $DB_ACCOUNT | sudo chpasswd
myfatal $? ">>>    Update password (${DB_USERNAME})... FAILED"
