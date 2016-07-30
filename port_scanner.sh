#!/bin/bash
echo -n "Enter domain/IP address > "
read address
echo -n "Enter port number > "
read port
echo "================="
echo ""
echo "testing git commit"
echo "testing multiple commits"
nmap -p $port $address | grep -i -A 1 state
