#!/usr/bin

ID=$(id -u)

validate (){ 
    if [ $1 -ne 0 ]
    then 
        echo "$2 is failed"
        exit 1
    else
        echo "$2 sucess"
    fi
}

if [ $ID -ne 0 ]
then
    echo "Error: you are not in the root user"
    exit 1
else
    echo "you are in root user"
fi

dnf install nginx -y
validate $? "Installing nginx"



