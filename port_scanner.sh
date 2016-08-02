#!/bin/bash
#check for package installation

if (dpkg --get-selections | grep -q nmap); then
#If true, do nothing
#using the no-op command 
	:
else
	echo "nmap not present on machine"
	echo "Installing nmap.."
	sudo apt-get install nmap
fi

echo -n "Enter domain/IP address > "
read address
echo -n "Enter port number > "
read port
echo "================="

nmap -p $port $address | grep -i -A 1 state
