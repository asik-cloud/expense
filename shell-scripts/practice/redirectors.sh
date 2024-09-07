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

    dnf list installed $package 
    if [ $? -ne 0 ]
    then
        echo "installing $package"
    else
        echo "$package Either already installed or installation failed"
    fi
}

ROOT_CHECK

for package in $@
do
    VALIDATE 
    if [ $? -ne 0 ]
    then
        echo "installing $package"
        dnf install $package -y
    fi
done
