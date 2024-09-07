#!/bin/bash

USER=$(id -u)

ROOT_CHECK(){
    if [ $USER -ne 0 ]
    then
        echo "swich to Root"
        exit 1
    fi
}

VALIDATE(){
 
    if [ $1 -ne 0 ]
    then
        echo "$2 failed"
    else
        echo "$2 Success"
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
    dnf list installed $package 
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.." 
        dnf install $package -y 
        VALIDATE $? "Installing $package"
    else
        echo "$package is already installed..nothing to do" 
    fi
done