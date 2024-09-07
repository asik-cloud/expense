#!/bin/bash

USER=$(id -u)

ROOT_CHECK(){

    if [ $USER -ne 0 ]
    then    
        echo "Switch to root user"
        exit 1
    fi
}

ROOT_CHECK


dnf list installed git
if [ $? -ne 0 ]
then
    echo "installing git"
    dnf install git -y
else
    echo "Git already installed"
fi