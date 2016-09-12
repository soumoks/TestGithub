#!/bin/bash
echo "Enter the key file"
read key
echo "entered key is $key"
echo "Enter the complete DNS name including the user login"
read dns
echo "entered dns name is $dns"
#Create a pipe
mkfifo /tmp/remote
#start wireshark reading from the same pipe
wireshark -k -i /tmp/remote
#Dump the packet capture from the instance onto the earlier created pipe
ssh -i "$key" "$dns" "sudo tcpdump -s 0 -U -n -w - -i eth0 not port 22" > /tmp/remote
