#!/bin/bash

source ./environmental_variables.env

InfaMigPath=$HOME/workspace/Informatica_Migration
echo "$InfaMigPath"

echo "Source repository is " $SRC_REP
echo "Username is " $USERNAME
echo "password is " $PASSWORD
echo "domain is " $DOMAIN
echo "pmserverdir is " $PMSERVERDIR
echo "usersecurity domain is " $USERSECURITYDOMAIN
echo "Migration path is " $InfaMigPath

##### Connecting to the Source repository
$PMSERVERDIR/pmrep connect -r $SRC_REP -d $DOMAIN -n $USERNAME -x $PASSWORD -s $USERSECURITYDOMAIN
RETURN_CODE=$?
echo "RETURN_CODE: "$RETURN_CODE 

        if [ $RETURN_CODE == 0 ]
        then
        echo "Connected to the Repository "$SRC_REP
        echo
        echo "Connected to the Repository "$SRC_REP 
        else
        echo "Failed to Connect to the Repository "$SRC_REP
        echo "Failed to Connect to the Repository "$SRC_REP 
        #echo "Check the log file "$LogFileDir/$LogFileName
        echo
        exit 1
        fi