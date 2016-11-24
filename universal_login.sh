#!/bin/bash

#####Store the current directory path########
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

##Defaults

#Default username
username=ec2-user

#default directory for certificates
#current directory
cert_dir=$DIR
echo "Current directory $cert_dir"

