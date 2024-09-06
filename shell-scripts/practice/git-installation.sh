#!/bin/bash
USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "Switch to root" 
    exit 1
fi   


dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then 
        echo "git not installed"
    else   
        echo "git installed"
    fi
else
    echo "git already installed"
fi
