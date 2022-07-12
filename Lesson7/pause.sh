#!/bin/bash
name="ping"
PID=""
#Start pinging
/bin/bash ping.sh &
#
PID=$(ps -e | grep $name | awk '{print $1}')
if ! [ -n "$PID" ]; then
    echo "PING is not running"
#    echo $PID
    exit 1
else
    echo "PING has $PID ID of process."
fi
#Pausing PING process
echo "Pausing PING command..."
if !  [ $(id -u) = 0 ]; then
    sudo kill -20 $PID
else
    kill -20 $PID
fi
echo ""
# Check if ping has 'T' state 
ps -el
#
echo ""
n=1
while [ $n -le 10 ]
do
echo "$n process $name with PID $PID suspended"
sleep 1
n=$((n+1))
done
#Resuming PING process
if !  [ $(id -u) = 0 ]; then
    sudo kill -18 $PID
else
    kill -18 $PID
fi
