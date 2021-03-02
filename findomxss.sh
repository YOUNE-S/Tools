#!/bin/bash
#interlace -tL /root/programs/$1/js-urls.txt -threads 5 -c bash /root/tools/findomxss.sh _target_ | tee -a /root/programs/$1/dom-xss.txt" -v
cat /root/programs/$1/js-urls.txt | xargs -I %% bash -c 'bash /root/tools/findomxss.sh %% '
#cat /root/programs/$1/js1-endpoints.txt | grep   ^\/ |tee -a /root/programs/$1/wordlist-from-js.txt
#cat /root/programs/$1/js1-endpoints.txt | grep  .http | tee -a /root/programs/$1/urls-from-js.txt
mv /root/tools/results /root/programs/$1/
