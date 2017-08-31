#!/bin/bash

# INT ["/usr/bin/supervisord"]
# CMD ["-c", "/etc/supervisor/supervisord.conf", "-n"]

SUPERVISOR=${SUPERVISOR:-"supervisord"}
SUPERVISOR_CONFIG=${SUPERVISOR_CONFIG:-"/etc/supervisor/supervisord.conf"}
SUPERVISOR_SLEEP=${SUPERVISOR_SLEEP:-"5"}
SUPERVISOR_ARGS=${SUPERVISOR_ARGS:-"-n"}

if [ "$SUPERVISOR" == "supervisord" ]
then
    SUPERVISOR=$(type -P "$SUPERVISOR")
fi

if [ ! -x "$SUPERVISOR" ]
then
    echo "Binary not found ($SUPERVISPR). Exit." > /dev/stderr
    exit 1
fi

echo "Prepare supervisord:"
echo " * $SUPERVISOR -c $SUPERVISOR_CONFIG $SUPERVISOR_ARGS $@"

if [ "$SUPERVISOR_SLEEP" -gt "0" ]
then
    echo -n " * wait ${SUPERVISOR_SLEEP}s (delay) ... "
    sleep $SUPERVISOR_SLEEP
    echo "Ready."
fi

echo ""

exec "$SUPERVISOR" -c $SUPERVISOR_CONFIG "$SUPERVISOR_ARGS" "$@"

