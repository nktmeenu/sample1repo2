#!/bin/bash

source ./environmental_variables.env

InfaMigPath=$HOME/workspace/Informatica_Migration
echo "$InfaMigPath"
LogFileDir=$InfaMigPath/logs
date=`date +'%Y-%m-%d %H%M%S'`
LogFileName=Infa_DG_NC_$date.log
export USERNAME=$1
export PASSWORD=$2
export SRC_REP=$3
export TGT_REP=$4
export NAME=$5
export ACTION=$6

##### Nullifying the log file
cat /dev/null>$LogFileDir/$LogFileName

##### Connecting to the Source repository
$PMSERVERDIR/pmrep connect -r $SRC_REP -d $DOMAIN -n $USERNAME -x $PASSWORD -s $USERSECURITYDOMAIN 2>>$LogFileDir/$LogFileName 1>>$LogFileDir/$LogFileName
RETURN_CODE=$?
echo "RETURN_CODE: "$RETURN_CODE  >>$LogFileDir/$LogFileName

        if [ $RETURN_CODE == 0 ]
        then
        echo "Connected to the Repository "$SRC_REP
        echo
        echo "Connected to the Repository "$SRC_REP >>$LogFileDir/$LogFileName
        else
        echo "Failed to Connect to the Repository "$SRC_REP
        echo "Failed to Connect to the Repository "$SRC_REP >>$LogFileDir/$LogFileName
        echo "Check the log file "$LogFileDir/$LogFileName
        echo
        exit 1
        fi