#!/bin/bash

if [ "$1" == "" ]; then
	echo "Usage: ./ssh-script.sh [path file key]"
	echo "Example: ./ssh-script.sh idrsa_192.168.1.1_admin or ./ssh-script.sh /home/admin/idrsa_192.168.1.1_admin"
else
	counter=0
        #looping each string that have _ (underscore)
	for val in ${1//_/ }; do

	   if [ "$counter" == "1" ]; then
	       ip_address=$val
	   fi

	   if [ "$counter" == "2" ]; then
	       username=$val
	   fi

	   #increment counter
	   ((counter=counter+1))
	done

echo "ssh to server $ip_address"
echo "using ssh key $1 with username $username"

sudo ssh -i "$1" "$username"@"$ip_address"
fi


