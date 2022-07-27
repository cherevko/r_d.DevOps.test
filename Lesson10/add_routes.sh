#!/bin/bash
#check if enough rights
if !  [ $(id -u) = 0 ]; then
	sudo ip route add 212.100.54.64/26 via 212.100.54.254 metric 1
	sudo ip route add 212.100.54.128/26 via 212.100.54.254 metric 1
	sudo ip route add 212.100.54.192/26 via 212.100.54.254 metric 1 
else
	ip route add 212.100.54.64/26 via 212.100.54.254 metric 1
	ip route add 212.100.54.128/26 via 212.100.54.254 metric 1
	ip route add 212.100.54.192/26 via 212.100.54.254 metric 1
    
fi

