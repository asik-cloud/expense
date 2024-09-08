#!/bin/bash
USER=$(id -u)
LOG_FOLDER="/var/log/expense"
SCRIT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d_%h%M%s)
LOG_FILE=$LOG_FOLDER/$SCRIT_NAME.log
sudo mkdir -p $LOG_FOLDER
R="\e[31m"
G="\e[32m"
Y="\e[33m"

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

dnf module disable nodejs -y &>>$LOG_FILE
VALIDATE $? "Disabling Nodesjs 16"

dnf module enable nodejs:20 -y &>>$LOG_FILE
VALIDATE $? "Enabling Nodesjs:20"

dnf list installed nodejs &>>$LOG_FILE
    if [ $? -ne 0 ]
    then    
        echo "Installing NodeJs"
        dnf install nodejs -y &>>$LOG_FILE
        VALIDATE $? "Installing NodeJs"
    else
        echo "NodeJs already Installed"
    fi

id expense
    if [ $? -ne 0 ]
    then    
        echo "Adding User expense"
        useradd &>>$LOG_FILE
        VALIDATE $? "Adding user"
    else
        echo "User Already exists."
    fi
 mkdir -p /app &>>$LOG_FILE
 curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip &>>$LOG_FILE
 VALIDATE $? "Downloading backend data"

 cd /app
 unzip /tmp/backend.zip &>>$LOG_FILE
 VALIDATE $? "Extracting the data"

npm install &>>$LOG_FILE

cp /home/ec2-user/practice-81s/shell-scripts/Expense/backend.service /etc/systemd/system/backend.service

systemctl daemon-reload 

systemctl enable backend
VALIDATE $? "Enabling"

systemctl start backend
VALIDATE $? "Starting/restarting"

yum list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]
then 
    echo " Installing mysql client"
    dnf install mysql -y- &>>$LOG_FILE
    VALIDATE $? "Installing mysql client"
else
    echo " Already installed ...skipping"
fi

mysql -h 172.31.29.81 -uroot -pExpenseApp@1 < /app/schema/backend.sql
VALIDATE $? "Loading Schema"

systemctl restart backend
VALIDATE $? "Restarting backend"

