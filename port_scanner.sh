#!/bin/bash
echo -n "Enter domain/IP address > "
read address
echo -n "Enter port number > "
read port
echo "================="
echo ""
nmap -p $port $address | grep -i -A 1 state
