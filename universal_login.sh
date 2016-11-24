#!/bin/bash

#####Store the current directory path########
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

##Defaults

#Default username
username=ec2-user

#default directory for certificates
#current directory
cert_dir=$DIR
#echo "Current directory is $cert_dir"

#default cert
cert=/Downloads/Mumbai.pem

#default ssh command
#echo "This is default ssh command ssh -i key_file ec2-user@IPadd/domain_name"

#certs present in the default directory - current directory
echo "These are the certs present in the default directory"
find . -type f -name \*.pem >certs.txt
cat certs.txt
