#!/bin/bash

bar="---------------------------------------"

cd
HOST=$1 
mkdir programs/$HOST
sublist3rPATH=/root/programs/$HOST/$HOST-sublist3r.txt
subfinderPATH=/root/programs/$HOST/$HOST-subfinder.txt
amassPATH=/root/programs/$HOST/$HOST-amass.txt
assetfinderPATH=/root/programs/$HOST/$HOST-assetfinder.txt
findomainPATH=/root/programs/$HOST/$HOST-findomain.txt

# Mainting social distancing between vars and funcs :) 

function automateSublist3r() {
	echo -e "\n$bar\n\tRunning Sublist3r\n$bar\n"
	sublist3r -v -t 100  -d $HOST -o $sublist3rPATH
}

function automateSubfinder() {
	echo -e "\n$bar\n\tRunning Subfinder\n$bar\n"
	subfinder -o $subfinderPATH -t 100 -d $HOST 
}

function automateAmass() {
	echo -e "\n$bar\n\tRunning Amass\n$bar\n"
	amass enum -active -o $amassPATH -d $HOST
}

function automateAssetsFinder() {
	echo -e "\n$bar\n\tRunning Assets finder\n$bar\n"
	assetfinder --subs-only $HOST | tee -a $assetfinderPATH
}

function automateFindomain() {
	echo -e "\n$bar\n\tRunning Findomain\n$bar\n"
	/root/tools/findomain-linux -t $HOST -u $findomainPATH
}

function sortResults() {
	cd 
	cd programs/$HOST/
	cat *.txt | sed "s/www.//" | sed "s/nwww.//" | sort | uniq > results1.txt
	cat results1.txt| sort | uniq > results.txt
	rm -r resulst1.txt
	echo -e "\n$bar\nFinal Results:\n$bar\n"
	echo -e "[#] Subdomains Count: $(wc -l < results.txt)\n"
}

function resolveSubdomains() {
	cd
	cd programs/$HOST/
	cat /root/programs/$HOST/results.txt | massdns -r /root/stuf/resolvers.txt --quiet -t A -o S -w /root/programs/$HOST/results-resolved.txt

	echo -e "[#] Resolved Count: $(wc -l < /root/programs/$HOST/results-resolved.txt)\n"
	cat /root/programs/$HOST/results-resolved.txt
}

function justIps() {
	cd
	cd /root/programs/$HOST/
	cat results-resolved.txt | cut -d']' -f2 | awk '{print $3}' | tr ',' '\n' | sort -u |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" > ips-amass.txt
}


automateSublist3r $HOST
automateSubfinder $HOST
#automateAmass $HOST
automateOneForAll $HOST
automateAssetsFinder $HOST
automateFindomain $HOST

sortResults
resolveSubdomains
justIps
