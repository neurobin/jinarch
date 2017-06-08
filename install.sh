#!/bin/sh
chkroot(){
	if [ "$(id -u)" != "0" ]; then
	  err_out "root access required."
	  exit 1
	fi
}
chkroot
cp jinarch /usr/bin/jinarch
chmod 755 /usr/bin/jinarch
cp jinarch.conf /etc/jinarch.conf
