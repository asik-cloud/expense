#!/bin/bash

USER=$(id -u)
LOG_FOLDER="/var/log/shell-scripts"
SCRIT_NAME=$(echo $0 | cut -d "." -f1)
mkdir -p $LOG_FOLDER
TIMESTAMP=$(date +%y-%m-%d-%H:%M:%S)
LOG_FILE="$LOG_FOLDER/$SCRIT_NAME-$TIMESTAMP.log"

ROOT_CHECK(){

    if [ $USER -ne 0 ]
    then    
        echo "Switch to root user"
        exit 1
    fi
}

VALIDATE(){

    if [ $1 -ne 0 ]
    then
        echo " $2...failed " | tee -a $LOG_FILE
    else   
        echo " $2...success " | tee -a $LOG_FILE
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
    
    dnf list installed $package | tee -a $LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "installing $package"
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? " $package Installation "
    else
        echo "$package already installed"
    fi
done