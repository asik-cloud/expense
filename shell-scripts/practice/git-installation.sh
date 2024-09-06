#!/bin/bash
USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "Switching to root"
    sudo su -    
   
else 
    dnf install git -y
    echo "Bye bye"
fi
