#!/bin/sh

#
# Simple Password Generator
#

echo This is a simple password generator
read -p 'Please enter the length of the password: ' userinput

# remove all non-digits from the input
PASS_LENGTH="${userinput//[!0-9]}"

# if invalid, repeat until the user enters a valid positive integer
while [ "$PASS_LENGTH" != "$userinput" ]
do
	printf '\nPassword length should be a positive integer, obviously...\n'
    read -p 'Please enter the length of the password: ' userinput
	PASS_LENGTH="${userinput//[!0-9]}"  # remove all non-digits
done

# password generation and output
printf '\n\nList of generated passwords\n\n'
for p in $(seq 1 5)
do
	tr -dc 'A-Za-z0-9!"#$%&()*+,-./:;<=>?@[\]^_`{|}~'\''' </dev/urandom | head -c $PASS_LENGTH
	echo
done
echo
