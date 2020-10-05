#Encrypting file using bcrypt
# we need to install bcrypt using
# $ sudo apt-get install bcrypt

#!/bin/bash

echo "This is a simple file encrypter/decrypter"
echo -n "Enter a file name : "
read file
 
if [ ! -f $file ]
then
	echo "$file not a file!"
	exit 1
fi
bcrypt $file

# it automatically removes the file after encrypting
# and stores the encrypted version of the file

echo "done"
