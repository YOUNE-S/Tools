#!/bin/bash

cd
HOST=$1
mkdir /var/www/html/$HOST
cat programs/$HOST/results.txt | httpx -title -vhost -status-code |  tee -a  programs/$HOST/urls-info.txt
cat programs/$HOST/urls-info.txt | awk '{print $1}' | tee -a programs/$HOST/urls.txt
cat  programs/$HOST/urls.txt  | aquatone -ports xlarge  -out /root
cd 
mv screenshots/  /var/www/html/$HOST
mv headers/  /var/www/html/$HOST 
mv html/  /var/www/html/$HOST
mv aquatone_report.html  /var/www/html/$HOST
mv aquatone_urls.txt  /var/www/html/$HOST
mv aquatone_session.json /var/www/html/$HOST
chmod -R 755  /var/www/html/$HOST/screenshots

