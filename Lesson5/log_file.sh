#!/bin/bash
file="$HOME/log_ordered.txt"
path="/var/log"
#check if exists and remove
if [ -f $file ]; then
    rm -f $file
fi
#find and order by size
find $path -type f -printf "%s %p\n" | sort -n -r >> $file