#!/bin/bash
USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "Switch to root" 
    exit 1
fi   


dnf list installed $1
if [ $? -ne 0 ]
then
    dnf install $1 -y
    if [ $? -ne 0 ]
    then 
        echo "$1 not installed"
    else   
        echo "$1 installed"
    fi
else
    echo "$1 already installed"
fi

dnf list installed $2
if [ $? -ne 0 ]
then
    dnf install $2 -y
    if [ $? -ne 0 ]
    then 
        echo "$2 not installed"
    else   
        echo "$2 installed"
    fi
else
    echo "$2 already installed"
fi
