#!/bin/bash
echo "Enter the key file"
read key
echo "entered key is $key"
echo "Enter the complete DNS name including the user login"
read dns
echo "entered dns name is $dns"
mkfifo /tmp/remote
wireshark -k -i /tmp/remote
ssh -i "$key" "$dns" "sudo tcpdump -s 0 -U -n -w - -i eth0 not port 22" > /tmp/remote
