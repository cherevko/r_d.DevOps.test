#!/bin/bash
file="$HOME/usr_executable.txt"
dst="$HOME/cmd_names.txt"
#remove $dst if exists
if [ -f $dst ]; then
    rm -f $dst
fi
#read the file line by line
n=1
while IFS= read -r ln; do
    if [ $n -le 10 ]; then
	#write first 10 lines to the file
	ln=${ln##*/}
	echo "$ln" >> $dst
    fi
    n=$((n+1))
done < $file
echo "The file has $n lines"
