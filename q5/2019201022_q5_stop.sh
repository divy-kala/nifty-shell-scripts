#!/bin/bash

echo cleanup running	
sudo mv -f resolv_bu.conf /etc/resolv.conf 
if [ -n "$?" ] ; then
	echo vpn has exited
fi
sudo rm config.ovpn
sudo killall openvpn
