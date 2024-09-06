#!/bin/bash
USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "Switch to root" 
    exit 1
fi   

VALIDATE(){

    if [ $1 -ne 0 ]
    then 
        echo "$2 not installed"
    else   
        echo "$2 installed"
    fi
}


dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing git"
else
    echo "git already installed"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else
    echo "mysql already installed"
fi


