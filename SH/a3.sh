#!/bin/bash

FOLDER=/home/dennis/TEMP/
CONFIG=//home/dennis/Documentos/bp_file

DAY=$(date +%d)
MONTH=$(date +%m)

mkdir -p $FOLDER/$MONTH

DESTINATION=$FOLDER/$MONTH/$DAY.tar.gz


###############################################################################

if [[ -f $CONFIG ]]
    then
        echo
    else
        echo
        echo "Config File doesn't exit"
        echo "Failure in execution"
        echo
        exit
fi



exit 0
