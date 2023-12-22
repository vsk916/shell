#!/bin/bash

ID=$(id -u)

timestamp=$(date +%F-%H-%M-%S)

logfile="/tmp/$0-$timestamp.log"

validate () {
    if [ $1 -ne 0 ]
    then 
        echo "$2 is .........failure"
    else
        echo "$2 is .........success"
    fi

    }

if [ $ID -ne 0 ]
then 
    echo "Error you are not in the root user"
else
    echo "You are in the root user"
fi

dnf install nginx -y  &>> $logfile

validate $? "nginx is installing"