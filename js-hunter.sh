#!/bin/bash
cat /root/programs/$1/urls.txt | subjs | sed 's/?.*//'|sort -u |tee -a /root/programs/$1/js-urls.txt
getJS --url /root/programs/$1/urls.txt  --complete --resolve | tee -a /root/programs/$1/js-urls.txt
cat /root/programs/$1/js-urls.txt | httpx -follow-redirects -silent  -status-code |  tee -a  /root/programs/$1/js-urls-info.txt
rm -r  /root/programs/$1/js-urls.txt
cat /root/programs/$1/js-urls-info.txt  | grep $1 | grep "[200]" | sort -u | awk '{print $1}' | tee -a /root/programs/$1/js-urls.txt
rm -r /root/programs/$1/js-urls-info.txt 
