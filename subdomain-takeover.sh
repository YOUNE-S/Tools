
#!/bin/bash
cd  
HOST=$1
mkdir programs/$HOST/subdomain-takeover	
subjack -w programs/$HOST/results.txt -a -v -t 100 -timeout 30 -o programs/$HOST/subdomain-takeover/$HOST-subjack.txt -ssl 
