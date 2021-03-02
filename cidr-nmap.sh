#!/bin/bash
mkdir /var/www/html/$1/$1/cidr/
touch /var/www/html/$1/$1/cidr/nmap.txt
interlace -tL /var/www/html/$1/$1/cidr.txt -threads 5 -c  "nmap -sC -sV -p- _target_  | tee -a  /var/www/html/$1/$1/cidr/nmap.txt" -v
