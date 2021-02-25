!#/bin/bash/
mkdir /root/programs/$1/urls
touch  /root/progarms/$1/urls/gau-all-urls-from-subomains.txt
interlace -tL /root/programs/$1/results.txt -threads 5 -c "gau _target_ |egrep -iv ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|js)"|tee -a /root/programs/$1/urls/gau-all-urls-from-subdomains.txt"  -v
#cat /root/programs/$1/results.txt | xargs -I %% bash -c 'gau %% | tee -a /root/programs/$1/urls/gau-all-urls-from-subdomains.txt
