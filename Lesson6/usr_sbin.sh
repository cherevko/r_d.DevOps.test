#!/bin/bash
file="$HOME/usr_executable.txt"
path="/usr/sbin"
#all must have r+x permission.
#in /usr/sbin only lyncs correspond such requirement
find $path -perm -666 | sort > $file
