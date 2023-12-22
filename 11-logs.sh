#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
timestamp=$(date +%F-%H-%M-%S)

logfile="/tmp/$0-$timestamp.log"

echo "Script started executing at $timestamp"

validate () {
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is $R.........failure$N"
    else
        echo -e "$2 is $G.........success$N"
    fi

    }

if [ $ID -ne 0 ]
then 
    echo -e "$R Error you are not in the root user$N"
else
    echo "You are in the root user"
fi

dnf install nginx -y  &>> $logfile

validate $? "nginx is installing"