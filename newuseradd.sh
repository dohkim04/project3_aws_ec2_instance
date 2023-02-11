#!/bin/bash
# a simple script to accept a single user.
echo "Please enter new user name to add to our system:"
read name
echo "Please wait while we are processing your request"
sleep 1
echo "Check whether the entered string follows the Linux user name rules..."
sleep 2
if [ -z $name ]
then
  echo -e "\n$name is empty. please try again"
  exit 1
else
#  if ! [[ "$name" =~ ^[a-z_]([a-z0-9_-]{0,31}|[a-z0-9_-]{0,30}\$)$ ]]
  if ! [[ "$name" =~ ^[a-z_][a-z0-9_-]{0,31}$ ]] #EC2 Linux cannot accept postfix $ sign as user name
  then
    echo -e "\nError: $name does not follow the correct name rule. Try again"
    exit 1
  else
    echo -e "\n$name does follow the correct name rule. Will create username"
    sudo useradd -d $name
    exit 0
  fi
fi
# "==================================================================="
# "This script was created by Do Hyung Kim on Feb. 10, 2023."
# "Please acknowledge this is the original work when you make changes."
# "Thank you so much!"
# "==================================================================="
