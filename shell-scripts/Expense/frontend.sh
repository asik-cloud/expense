#!/bin/bash
USER=$(id -u)
LOG_FOLDER="/var/log/expense"
SCRIT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d_%h%M%s)
LOG_FILE=$LOG_FOLDER/$SCRIT_NAME-$TIMESTAMP.log
sudo mkdir -p $LOG_FOLDER
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

ROOT_CHECK(){

    if [ $USER -ne 0 ]
    then  
        echo "swich to root"
        exit 1
    fi
}

VALIDATE(){

    if [ $1 -ne 0 ]
    then
        echo -e "$2...$R failed $N" | tee -a $LOG_FILE
    else    
        echo -e "$2...$G success $N" | tee -a $LOG_FILE
    fi

}

ROOT_CHECK

dnf list installed nginx &>>$LOG_FILE
    if [ $? -ne 0 ]
    then    
        echo "Installing nginx"
        dnf install nginx -y &>>$LOG_FILE
        VALIDATE $? "Installing nginx"
    else
        echo "nginx already Installed"
    fi
systemctl daemon-reload 

systemctl enable nginx
VALIDATE $? "Enabling"

systemctl start nginx
VALIDATE $? "Starting/restarting"

rm -rf /usr/share/nginx/html/*

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>>$LOG_FILE

cd /usr/share/nginx/html

 unzip /tmp/frontend.zip &>>$LOG_FILE
 VALIDATE $? "Extracting the data"

cp /home/ec2-user/practice-81s/shell-scripts/Expense/expense.conf /etc/nginx/default.d/expense.conf


systemctl restart nginx
VALIDATE $? "Restarting nginx"


