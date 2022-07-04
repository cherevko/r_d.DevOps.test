#!/bin/bash
file="$HOME/file_dscr.txt"
#print PID and file name
lsof -p $$ | awk '{print $2,$9}' > $file
