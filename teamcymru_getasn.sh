#!/bin/bash

folder=$1

echo -e 'begin\ncountrycode\nprefix\nnoheader' > $folder/tmp
cat $folder/part-r-00000 >> $folder/tmp
echo 'end' >> $folder/tmp
netcat whois.cymru.com 43 < $folder/tmp| tail -n +2 |awk -F '|' '{gsub(/ /, "", $0); gsub(",", "-", $5); print $1";"$2";"$3";"$4";"$5} ' > $folder/filter2_sip_ans.txt
rm $folder/tmp
