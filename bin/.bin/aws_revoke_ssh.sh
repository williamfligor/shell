#!/bin/bash

sg=$1

echo "Removing SSH Access for $sg"

# get the cidrs for the ingress rule
rules=$(aws ec2 describe-security-groups --group-ids $sg --output text --query 'SecurityGroups[*].IpPermissions')
# rules will contain something like:
# 22 tcp 22
# IPRANGES 108.42.177.53/32
# IPRANGES 10.0.0.0/16
# 80 tcp 80
# IPRANGES 0.0.0.0/0
# luckily, aws returns all ipranges per port grouped together

# flag for if we are reading ipranges
reading=0
# loop returned lines
while read -r line; do
    # split the line up
    rulebits=($line)
    # check if if we are reading ssh port ipranges
    if [ $reading -eq 0 ] ; then
        # we are not reading ipranges
        # check if '22 tcp 22'
        if [ ${rulebits[0]} == "22" ] && [ ${rulebits[1]} == "tcp" ] && [ ${rulebits[2]} == "22" ] ; then
            # found it
            reading=1           
        fi
    else
        # we are reading ipranges
        # check if first word is 'IPRANGES'
        if [ ${rulebits[0]} == "IPRANGES" ] ; then
            # found a cidr for open ssh port
            cidr=${rulebits[1]}
            echo -n found port 22 open cidr $cidr closing...
            # close it
            aws ec2 revoke-security-group-ingress --group-id $sg --protocol tcp --port 22 --cidr $cidr --output text
            if [ $? -eq 0 ] ; then
                echo " OK"
            else
                echo " ERROR"
            fi
        else
            # new port
            reading=0       
        fi
    fi
done <<< "$rules"
