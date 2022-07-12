#!/bin/bash
name="apache2"
PID=""
#check if apache is running
PID=$(ps -aU root | grep apache2 | awk '{print $1}')
if ! [ -n "$PID" ]; then
    echo "Apache2 Server is not running"
#    echo $PID
    exit 1
else
    echo "Apache Server has $PID ID of process."
fi
#Stopping Apache process
echo "Stopping Apache Server..."
kill -15 $PID 2> /dev/null
PID=""
#
sleep 10
#show count
#n=1
#while [ $n -le 10 ]
#do
#echo $n
#sleep 1
#n=$((n+1))
#done
#
#check if the process still exists
PID=$(ps -aU root | grep apache2 | awk '{print $1}')
if ! [ -n "$PID" ]; then
    echo "Apache Server has stopped."
    exit 1
fi
echo "Apache Server with process ID $PID is still running. Forcing it to stop..."
#check if enough rights
if !  [ $(id -u) = 0 ]; then
    sudo kill -9 $PID 2> /dev/null
else
    kill -9 $PID 2> /dev/null
fi

#check one more time
PID=""
PID=$(ps -aU root | grep apache2 | awk '{print $1}')
if [ -n "$PID" ]; then
    echo "Unable to stop Apache Server."
    exit 1
else
    echo "Apache Server has stoped."
    exit 1
fi
