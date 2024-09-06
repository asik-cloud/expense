#!/bin/bash
USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "Switching to root"
    sudo su -
    dnf install git -y
else 
    echo "Bye bye"
fi
