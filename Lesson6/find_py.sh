#!/bin/bash
path="/etc"
py_file="$HOME/py_scripts"
py_err="$HOME/py_errors"
#remove results if exist
if [ -f $py_file ]; then
    rm -f $py_file
fi
if [ -f $py_err ]; then
    rm -f $py_err
fi
find $path -type f -name *.py 1>$py_file 2>$py_err
lsof -p 19268 | awk '{print ,}' > /home/tasp/file_dscr.txt
