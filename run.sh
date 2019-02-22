#!/bin/bash

set -e -u

ETC_DIR=/etc/supervisor
SUPERVISOR_TEMPLATE=${SUPERVISOR_TEMPLATE:-$ETC_DIR/supervisord.conf.template}
SUPERVISOR_CONFIG=${SUPERVISOR_CONFIG:-$ETC_DIR/supervisord.conf}

export SUPERVISOR_IDENTIFIER=${SUPERVISOR_IDENTIFIER:-$(hostname)}
export SUPERVISOR_LOGLEVEL=${SUPERVISOR_LOGLEVEL:-info}
export SUPERVISOR_USER=${SUPERVISOR_USER:-root}

echo -n "Substitute envvars ... "
envsubst < ${SUPERVISOR_TEMPLATE} > ${SUPERVISOR_CONFIG}
echo "done"

echo "Starting up"
exec /usr/bin/supervisord \
    --configuration=${SUPERVISOR_CONFIG} \
    --identifier=${SUPERVISOR_IDENTIFIER} \
    --nodaemon
