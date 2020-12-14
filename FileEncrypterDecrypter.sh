#!/bin/bash

echo "This is a simple file encrypter/decrypter"
echo "Please choose what you want to do"

choice="Encrypt Decrypt"

select option in $choice; do
        if [ $REPLY = 1 ];
then
        echo "Please enter the filename you want to encrypt"
        read file;
        gpg -c $file
        echo "The file has been encrypted"
else
        echo  "Please enter the filename you want to decrypt"
        read file2;
        gpg -d $file2
        echo "The file has been decrypted"
fi

done
