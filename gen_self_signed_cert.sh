#!/bin/bash

#####Store the current directory path########
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


#####STEP 1#####
#####Generate Private Key#####
#beautify
echo "                                          "
echo "Enter private key name, uses name 'server' by default"
read private_key

if [ -z $private_key]
then 
	echo "using default name 'server'"
	private_key=server
else
	echo "using name $private_key"
fi

echo "Generating private key $private_key.key"
openssl genrsa -des3 -out $private_key.key 1024

#beautify
echo "						"
echo "=========================================="
echo "                                          "

#####STEP 2#####
#####Generate CSR####
echo "Enter the name of the CSR, uses name 'server' by default"
read CSR

if [ -z $CSR ]
then
        echo "using default name 'server'"
        CSR=server
else
        echo "using name $CSR"
fi

echo "Generating CSR $CSR.csr"
openssl req -new -key $DIR/$private_key.key -out $CSR.csr

#beautify
echo "                                          "
echo "=========================================="
echo "                                          "

#####STEP 3#####
#####Remove passphrase from key#####
cp $private_key.key $private_key.key.org
echo "Enter the passphrase in order to remove the passphrase"
openssl rsa -in $private_key.key.org -out $private_key.key

#beautify
echo "                                          "
echo "=========================================="
echo "                                          "

#####STEP 4#####
#####Generating a Self-signed certificate
echo "Enter the name of the cert, uses name 'server' by default"
read cert

if [ -z $cert]
then
        echo "using default name 'server'"
        cert=server
else
        echo "using name $cert"
fi

echo "Generating Cert $cert.crt"
openssl x509 -req -days 365 -in $DIR/$CSR.csr -signkey $private_key.key -out $cert.crt

#beautify
echo "                                          "
echo "=========================================="
echo "                                          "

echo "Generated files are $private_key.key,$CSR.csr and $cert.crt"
#beautify
echo "                                          "
