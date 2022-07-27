#!/bin/bash
#check if enough rights
if !  [ $(id -u) = 0 ]; then
	sudo ip route delete 212.100.54.64/26 via 212.100.54.254
	sudo ip route delete 212.100.54.128/26 via 212.100.54.254
	sudo ip route delete 212.100.54.192/26 via 212.100.54.254
else
	ip route delete 212.100.54.64/26 via 212.100.54.254
	ip route delete 212.100.54.128/26 via 212.100.54.254
	ip route delete 212.100.54.192/26 via 212.100.54.254
fi

