!#/bin/bash/
interlace -tL /root/programs/$1/js-urls.txt -threads 5 -c "bash /root/tools/findomxss.sh _target_ | tee -a /root/programs/$1/dom-xss.txt" -v
