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

mysql_secure_installation --set-root-pass ExpenseApp@1 | tee -a $LOG_FILE
VALIDATE $? "Setting up root password for mysql server"

mysql -h mysql.mohammedasik.shop -u root -pExpenseApp@1 ; show databases;
VALIDATE $? "checking databases"
