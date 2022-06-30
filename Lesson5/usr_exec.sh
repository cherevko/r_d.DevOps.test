#!/bin/bash
file="$HOME/executable.txt"
path="/etc"
#check if exists and remove
if [ -f $file ]; then
    rm -f $file
fi
#search using 'find' command
find $path -type f -executable >> $file
