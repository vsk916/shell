#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "Eroor:  YOu are not in the root access"
    exit 1
else
    echo "You are in the root access"
fi

dnf install nginx -y

if [ $? -ne 0 ]
then
    echo "Installation of nginx is failed"
    exit 1
else
    echo "installation success"
if