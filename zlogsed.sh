#!/bin/bash

if [ -z $1 ]; then
	echo "Path to search is not set";
	exit 1;
fi;

if [ -z $2 ]; then
	echo "String to search is not set";
	exit 1;
fi;

for filename in `ls $1 | grep gz`; do
    gzip -d -c $filename > temp.log;
    strCount=$(grep -o "$2" ./temp.log | wc -l);
    echo $filename "=>" $strCount;
    if [ "$strCount" != "0" ]; then
        sed -i "/$2/d" ./temp.log;
    fi;
    rm $filename;
    gzip -c temp.log > $filename;
    rm temp.log;
done;