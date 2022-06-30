#!/bin/bash
file="$HOME/etc_dir.txt"
#path="/etc/*"
path="/etc/*/*"
#check file and remove if exists
if [ -f $file ]; then
    rm -f $file
fi
#search using 'find' command
#find $path -type d >> $file

#search in loop
for var in $path
do
    if [ -d "$var" ]; then
	echo "$var" >> $file
    fi
done
