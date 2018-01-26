#!/bin/bash

if [ -z $1 ]; then
	echo "Path to search is not set";
	exit 1;
fi;

if [ -z $2 ]; then
	echo "String to search is not set";
	exit 1;
fi;

for filename in `ls $1 | grep -v "gz$"`; do
    echo $filename "=>" $(grep -o "$2" $1/$filename | wc -l);
    sed -i "/$2/d" $1/$filename;
done;
