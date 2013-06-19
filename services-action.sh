#!/bin/bash

## ./services-action.sh restart apache2=> To restart the apache2 server


initPath="/etc/init.d/"
services="apache2"

export IFS=","
if [ $# -lt 1 ]; then
        echo "Please enter an action to do"
        exit 1
fi

if [ ! "$2" == "" ]; then
        $initPath$2 $1
else
service apache2 restart
fi
