!#/bin/bash/
interlace -tL /root/programs/$1/js-urls.txt  -threads 5 -c "echo 'Scanning _target_ Now' ; python3 /root/tools/LinkFinder/linkfinder.py -d -i _target_  -o cli | tee -a /root/programs/$1/js1-endpoints.txt" -v
cat /root/programs/$1/js1-endpoints.txt | grep   ^\/ |tee -a /root/programs/$1/wordlist-from-js.txt
cat /root/programs/$1/js1-endpoints.txt | grep  .http | tee -a /root/programs/$1/urls-from-js.txt

