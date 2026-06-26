#!/bin/bash

ip=$(nslookup $1 | awk 'FNR == 6 {print $2}')
asn=$(whois -h whois.cymru.com " -v $ip" | awk 'FNR == 2 {print "AS"$1}')
if [ ! $asn ]; then
    printf "No ASN found. Please check domain spelling.\n"
    exit 1
else
echo "ASN: $asn"