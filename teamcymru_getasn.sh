#!/bin/bash

file=$1

echo -e 'begin\ncountrycode\nprefix\nnoheader' > output.txt
cat $file >> output.txt
echo 'end' >> output.txt
netcat whois.cymru.com 43 < output.txt| tail -n +2 |awk -F '|' '{gsub(/ /, "", $0); gsub(",", "-", $5); print $1";"$2";"$3";"$4";"$5} ' 

