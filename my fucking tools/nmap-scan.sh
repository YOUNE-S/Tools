!#/bin/bash

mkdir /root/programs/$1/nmap-scan
cd 
cd /root/programs/$1/nmap-scan
cat /root/programs/$1/ips-amass.txt  | xargs -I %% bash -c 'nmap -sC -sV -p- %% | tee -a %%.txt'
