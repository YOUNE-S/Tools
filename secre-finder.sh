#!/bin/bash
cat /root/programs/$1/js-urls.txt | xargs -I %% bash -c  'python3 /root/secretfinder/SecretFinder.py -i %%  -o cli |tee -a /root/programs/jslinksecret.txt'
mv /root/programs/jslinksecret.txt /root/programs/$1/jslinksecret.txt
