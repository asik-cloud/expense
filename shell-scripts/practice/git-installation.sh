#!/bin/bash
USER=$(id -u)

if [ $USER -ne 0 ]
then
    echo "Switch to root" 
else 
    dnf install git -y
    echo "Bye bye"
fi
