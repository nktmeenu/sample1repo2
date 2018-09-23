#!/bin/bash

#Sourcing the env variable for the user executing the script
source ./environmental_variables.env

#Defining VARIABLES to be used in the script
InfaMigPath=$(pwd)
echo "$InfaMigPath"


#Setting the parameters passed in the script as env variables for the session

##### Connecting to the Source repository, $DOMAIN defined in the env file
echo "Connecting to the Repository "$SRC_REP
pmrep connect -r $SRC_REP -d $DOMAIN -n $USERNAME -x $PASSWORD -s $USERSECURITYDOMAIN
RETURN_CODE=$?
echo "RETURN_CODE: "$RETURN_CODE

	if [ $RETURN_CODE == 0 ]
	then
	echo "Connected to the Repository "$SRC_REP
	echo
	echo "Connected to the Repository "$SRC_REP
	else
	echo "Failed to Connect to the Repository "$SRC_REP
	echo
	exit 1
	fi
