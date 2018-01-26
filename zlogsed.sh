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
    gzip -d -c $1/$filename > $1/temp.log;
    strCount=$(grep -o "$2" $1/temp.log | wc -l);
    echo $filename "=>" $strCount;
    if [ "$strCount" != "0" ]; then
        sed -i "/$2/d" $1/temp.log;
    fi;
    rm $1/$filename;
    gzip -c $1/temp.log > $1/$filename;
    rm $1/temp.log;
done;