#!/bin/bash

#Simple Password Generator 

echo "This is a simple password generator"
echo "Please enter the length of the password: "
read PASS_LENGTH
read -p "How many password you want?: " COUNT

for p in `seq $COUNT`;
do
	openssl rand -base64 48 | cut -c1-$PASS_LENGTH

done


