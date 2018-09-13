#!/bin/sh

#
# Simple Password Generator
#

getint() 	# prompts for input and repeats this until a valid positive int value is given
## Usage:
#	getint <PROMPT> <FAIL_MESSAGE>
#	 -> the value is returned in "$inputvalue"
{	local userinput
	read -p "$1" userinput
	inputvalue="${userinput//[!0-9]}"
	while [ "$inputvalue" != "$userinput" ]
	do
		printf "$2"
		read -p "$1" userinput
		inputvalue="${userinput//[!0-9]}"
	done
}

echo This is a simple password generator

# fetch the user input from the console
getint 'How many passwords will you need: ' '\nAn amount should be a positive integer, obviously...\n'
NUMBER=$inputvalue
echo
getint 'Please enter the length of the passwords: ' '\nPassword length should be a positive integer, obviously...\n'
PASS_LENGTH=$inputvalue

# password generation and output
printf '\n\nList of generated passwords\n\n'
for p in $(seq 1 $NUMBER)
do
	tr -dc 'A-Za-z0-9!"#$%&()*+,-./:;<=>?@[\]^_`{|}~'\''' </dev/urandom | head -c $PASS_LENGTH
	echo
done
echo
