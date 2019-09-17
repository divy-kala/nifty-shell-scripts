#!/bin/bash
echo Enter iiit user name
read user
echo Enter iiit password
read -s pass
openvpn 2>&1 1> /dev/null
if [ "$?" = 127 ] ; then
	sudo apt install openvpn
fi

function cleanup {
	echo byee
	echo vpn stopped	
	#sudo mv -f resolv_bu.conf /etc/resolv.conf 
	
	#sudo chattr +i /etc/resolv.conf
	
}

wget -O  "./config.ovpn" --user="$user" --password="$pass" "https://vpn.iiit.ac.in/secure/linux.ovpn"
sed -i  '/group nobody/c\group nogroup'  ./config.ovpn


cp /etc/resolv.conf resolv_bu.conf
#sudo chattr -i /etc/resolv.conf
#sudo chmod 744 /etc/resolv.conf
sudo sed -i '1s/^/nameserver 10.4.20.204\n/' /etc/resolv.conf
sudo openvpn --config "./config.ovpn" 

#sudo echo "nameserver 10.4.20.204" | cat -  /etc/resolv.conf > temp && mv temp /etc/resolv.conf










trap cleanup EXIT 

