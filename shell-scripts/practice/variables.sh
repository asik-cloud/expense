#!/bin/bash
person1=$1
person2=$2
R="\e[31m"
G="\e[32m"
B="\e[0m"
echo "$R $person1: Hi $person2! $R"
echo "$G $person2: Hello $person1. How are you? $G"
echo "$B $person1: I am doing good $person2 $B"
echo "$person2: $G Activate command mode"
