#!/bin/bash
#check for package installation

if [$(dpkg -s nmap)!=0] then;
        echo "nmap is not installed, installing..."
        sudo apt-get install nmap > /dev/null
        echo "package installed"
fi


echo -n "Enter domain/IP address > "
read address
echo -n "Enter port number > "
read port
echo "================="
echo ""
echo "testing git commit"
nmap -p $port $address | grep -i -A 1 state
