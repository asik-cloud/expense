#!/bin/bash

USER=$(id -u)

ROOT_CHECK(){

    if [ $USER -ne 0 ]
    then    
        echo "Switch to root user"
        exit 1
    fi
}


if [ $# -eq 0 ]
then 
    echo " Enter package(s) name(s) to install. Eg: git mysql postfix nginx ... "
    exit 1
fi

ROOT_CHECK

for package in $@
do
    
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "installing git"
        dnf install $package -y
    else
        echo "$package already installed"
    fi
done