!#/bin/bash/
cd
source .bashrc
touch /var/www/html/$1/$1/urls/dir-urls.txt
touch /var/www/html/$1/$1/urls/ffuf-urls.txt
touch /var/www/html/$1/$1/urls/gau-urls.txt
dirsearch -u $2 | tee -a /var/www/html/$1/$1/urls/dir-urls.txt
ffuf -w ~/tools/SecLists/Discovery/Web-Content/directory-list-2.3-big.txt  -u $2/FUZZ -fc 403  -v -sa -o  /var/www/html/$1/$1/urls/ffuf-url.txt
gau $2 | tee -a /var/www/html/$1/$1/urls/gau-urls.txt
