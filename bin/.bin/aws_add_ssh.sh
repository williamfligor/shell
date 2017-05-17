#!/bin/bash

sg=$1

ip=$(curl http://checkip.amazonaws.com/)

echo "Adding SSH Access for $ip to $sg"

aws ec2 authorize-security-group-ingress --group-id $sg --protocol tcp --port 22 --cidr $ip/32

