#!/bin/bash
file="$HOME/usr_executable.txt"
path="/usr/sbin"
#all must have r+x permission.
#find $path -type f -perm -555 | sort > $file
#
#in /usr/sbin only lyncs correspond such requirement
find $path -perm -555 | sort > $file
