#!/bin/bash
mkdir /var/www/html/$1/$1/nmap-cidr
cd
cd /var/www/html/$1/$1/nmap-cidr
cat /var/www/html/$1/$1/cidr.txt  | xargs -I %% bash -c 'nmap -sC -sV -p- %% | tee -a nmap-cidr.txt'
