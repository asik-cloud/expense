#!/bin/bash
USER=$(id -u)
LOG_FOLDER="/var/log/expense"
SCRIT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOG_FOLDER/$SCRIT_NAME-$TIMESTAMP.log"
mkdir -p $LOG_FOLDER
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[om"

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
        echo -e " $2...$G failed $N "

    else    
        echo -e " $2...$R success $N "
    fi
}
ROOT_CHECK
dnf list installed mysql-server | tee -a $LOG_FILE
if [ $? -ne 0 ]
then 
    echo "Installing mysql server"
    dnf install mysql-server -y &>>$LOG_FILE
    VALIDATE $? "Installing mysql-server"
else
    echo "mysql server is already installed"
fi

systemctl enable mysqld &>>$LOG_FILE
VALIDATE $? "Enabling mysql server"

systemctl start mysqld &>>$LOG_FILE
VALIDATE $? "Starting mysql server"

mysql -h 18.215.176.75 -u root -pExpenseApp@1 -e 'show databases;' &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "setting up password now"
    mysql_secure_installation --set-root-pass ExpenseApp@1 | tee -a $LOG_FILE
    VALIDATE $? "Password set"
else
    echo "Password already setup..Skipping"
fi
