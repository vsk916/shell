#!/usr/bin

ID=$(id -u)

validate () {
    if [ $? -ne 0 ]
    then 
        echo "Installation is failed"
        exit 1
    else
        echo "Installation is sucess"
    if
}

if [ $ID -ne 0 ]
then
    echo "Error: you are not in the root user"
    exit 1
else
    echo "you are in root user"
fi

dnf install nginx -y
validate



