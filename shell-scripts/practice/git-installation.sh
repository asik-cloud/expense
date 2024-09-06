#!/bin/bash
USER=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

if [ $USER -ne 0 ]
then
    echo "Switch to root" 
    exit 1
fi   

VALIDATE(){

    if [ $1 -ne 0 ]
    then 
        echo -e "$2 $R failed"
    else   
        echo -e "$2 $G Success"
    fi
}


dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "Installing git"
else
    echo -e "$Y git already installed"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing mysql"
else
    echo -e "$Y mysql already installed"
fi


