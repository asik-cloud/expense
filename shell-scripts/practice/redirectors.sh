#!/bin/bash

USER=$(id -u)

ROOT_CHECK(){
    if [ $USER -ne 0 ]
    then
        echo "swich to Root"
        exit 1
    fi
}

VALIDATE(){
 
    if [ $1 -ne 0 ]
    then
        echo "installing $2"
    else
        echo "$2 installation failed"
    fi
}

ROOT_CHECK

for package in $@
do
    dnf list installed $2
    if [ $? -ne 0 ]
    then
        echo "installing $package"
        dnf install $package -y
        VALIDATE $?
    else 
        echo "already installed"
    fi
    
done
