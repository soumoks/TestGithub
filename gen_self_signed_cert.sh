#!/bin/bash

#####Store the current directory path########
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#private_key =

#####Declare funtion - Detect empty variable#######
empty ()
{
	local var1=$1
	echo $var1
        if [ -z "var1" ]
        then
                echo "using default name 'server'"
                var1="server"
        else
                echo "using name $var1"
        fi
}

#####STEP 1#####
#####Generate Private Key#####
echo "Enter private key name, uses name 'server' by default"
read private_key
#empty $private_key

if [-z "$private_key]
then 
	echo "using default name 'server'"
	private_key=server
else
	echo "using name $private_key"
fi

echo "Generating private key $private_key.key"
openssl genrsa -des3 -out $private_key.key 1024

#####STEP 2#####
#####Generate CSR####
echo "Enter the name of the CSR, uses name 'server' by default"
####add an option to use default name#####
read CSR
empty $CSR
echo "Generating CSR $CSR.csr"
openssl req -new -key $DIR/$private_key.key -out $CSR.csr

#####STEP 3#####
#####Remove passphrase from key#####
cp $private_key.key $private_key.key.org
openssl rsa -in $private_key.key.org -out $private_key.key


#####STEP 4#####
#####Generating a Self-signed certificate
echo "Enter the name of the cert, uses name 'server' by default"
#####Add an option to use default name#####
read cert
empty $cert
echo "Generating cert $cert.crt"
openssl x509 -req -days 365 -in $DIR/$CSR.csr -signkey $private_key.key -out $cert.crt

