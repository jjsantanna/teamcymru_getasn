#!/bin/bash

file=$1

echo -e 'begin\ncountrycode\nprefix\nnoheader' > input.txt
cat $file >> input.txt
echo 'end' >> input.txt
netcat whois.cymru.com 43 < input.txt| tail -n +2 |awk -F '|' '{gsub(/ /, "", $0); gsub(",", "-", $5); print $1";"$2";"$3";"$4";"$5} ' 
rm input.txt