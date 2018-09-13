#!/bin/sh

#
# Simple Password Generator
#

echo This is a simple password generator
read -p 'How many passwords will you need ? ' userinput

# remove all digits from input
NUMBER="${userinput//[!0-9]}"

# if invalid, repeat until the user enters a valid positive integer
while [ "$NUMBER" != "$userinput" ]
do
	printf '\nAn amount should be a positive integer, obviously...\n'
    read -p 'How many passwords will you need: ' userinput
	NUMBER="${userinput//[!0-9]}"  # remove all non-digits
done
echo

# now let's do the same procedure to get the desired password length
read -p 'Please enter the length of the passwords: ' userinput
PASS_LENGTH="${userinput//[!0-9]}"
while [ "$PASS_LENGTH" != "$userinput" ]
do
	printf '\nPassword length should be a positive integer, obviously...\n'
    read -p 'Please enter the length of the password: ' userinput
	PASS_LENGTH="${userinput//[!0-9]}"
done

# password generation and output
printf '\n\nList of generated passwords\n\n'
for p in $(seq 1 $NUMBER)
do
	tr -dc 'A-Za-z0-9!"#$%&()*+,-./:;<=>?@[\]^_`{|}~'\''' </dev/urandom | head -c $PASS_LENGTH
	echo
done
echo
