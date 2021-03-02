!#/bin/bash
cat /root/programs/$1/js-urls.txt | while read url ; do bash /root/tools/jsvar.sh $url | tee -a /root/programs/$1/js_var.txt ; done
cat /root/programs/$1/js_var.txt |sort -u |sort -u| tee -a /root/programs/$1/jsvar.txt
rm -r /root/programs/$1/js_var.txt
