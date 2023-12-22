#!/bin/bash

ID=$(id -u)

if [ ID -ne 0 ]
then
    echo "Eroor:  YOu are not in the root access"
else
    echo "You are in the root access"
fi

dnf install nginx -y
