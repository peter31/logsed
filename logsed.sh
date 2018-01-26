#!/bin/bash

if [ -z $1 ]; then
	echo "Path to search is not set";
	exit 1;
fi;

if [ -z $2 ]; then
	echo "String to search is not set";
	exit 1;
fi;

checkWords=$( echo "$2" | sed 's/,/ /g' );

for filename in `ls $1 | grep -v "gz$"`; do
    for word in $checkWords; do
    	echo $filename "("$word")" "=>" $(grep -o "$word" $1/$filename | wc -l);
    	sed -i "/$word/d" $1/$filename;
	done;
done;
