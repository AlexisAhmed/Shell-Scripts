#!/usr/bin/bash


#####################################################################
##########		PASSWORD GENERATOR	 	#############
#####################################################################


echo "Password Generator"
## ASKING THE USER FOR THE SITE WHICH HE WANTS GENERATE A PASSOWRD
echo "Enter the sitename for which you want to generate a password"
read SITENAME

## WHAT LENGTH THE PASSWORD NEEDS TO BE GENERATED
echo "Please Enter the length of the password"
read PASSSIZE

## VARIABLES TO STORE THE PASSWORD 
FIRSTHALF=""
SECONDHALF=""
PASSLENG=`expr $PASSSIZE / 2`


## LOOPING ONE TIME FOR GENERATING THE PASSWORD. 
## YOU CAN CHANGE THE NUMBER IN THE SEQ TO ANY NUMBER WHICH GENERATES THAT NUMBER OF PASSWORDS, FROM WHICH YOU CAN SELECT.
for p in $(seq 1);
do
	FIRSTHALF=`openssl rand -base64 48 | cut -c1-$PASSLENG` 
	SECONDHALF=`openssl rand -base64 48 | cut -c1-$PASSLENG`
done

## STORING THE PASSWORDS TO A TEXT FILE FOR LATER REFERENCE
## UNCOMMENT THE BELOW LINE IF YOU WANTS TO STORE THE PASSWORDS
echo "$SITENAME:	$FIRSTHALF$SECONDHALF" >> passwords.txt

## PRINTING THE GENERATED PASSWORD TO THE CONSOLE
echo "$SITENAME:	$FIRSTHALF$SECONDHALF"
 























