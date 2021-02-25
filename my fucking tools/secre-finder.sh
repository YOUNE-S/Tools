!#/bin/bash/
interlace -tL /root/programs/$1/js-urls.txt -threads 5 -c "python3 /root/secretfinder/SecretFinder.py -i _target_ -o cli >> /root/programs/$1/jslinksecret.txt" -v
cat /root/programs/$1/jslinksecret
