#!/bin/bash

USER=$(id -u)
LOG_FOLDER="/var/log/Shellscripts"
SCRIT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIT_NAME-$TIMESTAMP.log"
mkdir -p $LOG_FOLDER


ROOT_CHECK(){
    if [ $USER -ne 0 ]
    then
        echo "swich to Root" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
 
    if [ $1 -ne 0 ]
    then
        echo "$2 failed" | tee -a $LOG_FILE
    else
        echo "$2 Success" | tee -a $LOG_FILE
    fi
}

ROOT_CHECK

# for package in $@
# do
#     dnf list installed $package
#     if [ $? -ne 0 ]
#     then
#         echo "installing $package"
#         dnf install $package -y
#         VALIDATE $? "$package"
#     else 
#         echo "already installed"
#     fi
    
# done

for package in $@ # $@ refers to all arguments passed to it
do
    dnf list installed $package | tee -a $LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.." | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "Installing $package"
    else
        echo "$package is already installed..nothing to do" | tee -a $LOG_FILE
    fi
done