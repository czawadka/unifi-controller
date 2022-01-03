#!/bin/bash
COOKIE_FILE=$TMPDIR/unifi-cookie.txt
HOST=$1
RULE=$2 # 61c3923a24aa9a013aa189b7
USR=$UNIUSR
PWD=$UNIPWD

# ignore output, it is for cookie only
curl --fail -S -s -o /dev/null -k -X POST --data "{\"username\": \"$USR\", \"password\": \"$PWD\"}" -c "$COOKIE_FILE" "$HOST/api/login" || exit 1
# responds with 'Not Found'
curl --fail -S -s -k -X GET -b "$COOKIE_FILE" "$HOST/api/s/default/rest/firewallrule/$RULE" || exit 1
