#!/bin/bash

set -x

# Time marker for both stderr and stdout
date; date 1>&2

KT=$1
PRINC=$2
RENEW_TIME=$3

KINIT=$(which kinit)
while true
do
    echo "Re-initing ${PRINC} from ${KT}"
    $KINIT -kt ${KT} ${PRINC}
    echo "Sleeping ${RENEW_TIME}"
    sleep ${RENEW_TIME}
done



