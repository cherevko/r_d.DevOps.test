#!/bin/bash
file="$HOME/file_dscr.txt"
#print PID and file name for current user
lsof -u $(whoami) | awk '{print $2,$9}' > $file
