#!/bin/bash
./automate-subdomain-enumeration.sh  $1
./subdomain-takeover.sh $1
./screenshot.sh   $1
./js-hunter.sh $1 
./endpoint-js.sh $1
./findomxss.sh $1
#./variable-finder.sh $1
./secre-finder.sh $1
./collect-gau-urls.sh $1
./nmap-scan.sh $1 
#mv /root/programs/$1 /var/www/html/$1
