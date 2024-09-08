#!/bin/bash
USER=$(id -u)
LOG_FOLDER="/var/log/expense"
SCRIT_NAME=$(echo $0 | cut -d "." f1)
TIMESTAMP=$(date +%Y-%M-%d-%H-%m-%s)
LOG_FILE="$LOG_FOLDER/$SCRIT_NAME.$TIMESTAMP.log"
mkdir -p $LOG_FOLDER
R="\e[31m"
G="\e[32m"
Y="\e[33m"

ROOT_CHECK(){

    if [ $USER -ne 0 ]
    then 
        echo "Switch to root"
        exit 1
    fi
}
VALIDATE(){

    if [ $1 -ne 0 ]
    then
        echo -e " $2...$G Success $N "
    else    
        echo -e " $2...$R failed $N "
    fi
}

