#!/bin/bash

#Simple Password Generator 

echo "######################### PASSWORD GENERATOR ##########################"
echo 
read -p "Please Enter the length of Password you want >> " PASS_LENGTH
read -p "How many password you want >> " COUNT

echo "Below are $COUNT random combinations : "

for p in $(seq 1 $COUNT);
do
	openssl rand -base64 48 | cut -c1-$PASS_LENGTH
done


