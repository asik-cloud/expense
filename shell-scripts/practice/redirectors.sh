#!/bin/bash

USER=$(id -u)

ROOT_CHECK(){
    if [ $USER -ne 0 ]
    then
        echo "swich to Root"
        exit 1
    fi
}

dnf list installed git 
if [ $? -ne 0 ]
then
    echo "installing git"
    dnf install git -y
else
    echo "Git is already installed"
fi
