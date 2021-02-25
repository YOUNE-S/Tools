!#/bin/bash/
cd
source .bashrc
touch /var/www/html/$1/$1/urls/dir-urls-$3.txt
touch /var/www/html/$1/$1/urls/gau-urls-$3.txt
cd tools/dirsearch
python3 dirsearch.py -u $2  --plain-text-report=/var/www/html/$1/$1/urls/dir-urls-$3.txt   --full-url  -x 403
ffuf -w ~/tools/SecLists/Discovery/Web-Content/directory-list-2.3-big.txt  -u $2/FUZZ -fc 403  -v  -o  /var/www/html/$1/$1/urls/ffuf-urls-$3.html -of html
gau $2 | tee -a /var/www/html/$1/$1/urls/gau-urls-$3.txt
ffuf -w /var/www/html/$1/$1/wordlist-from-js.txt -u $2/FUZZ -fc 403 -v -o /var/www/html/$1/$1/urls/ffuf-custom-urls-$3.html -of html


