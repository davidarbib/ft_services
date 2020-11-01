#!/bin/sh
/bin/sshd &
nginx & 
sleep 2
NGINX=$(pgrep "nginx")
SSH=$(pgrep "sshd")
while [ $NGINX ne "" && $SSH ne "" ]
do
	NGINX=$(pgrep "nginx")
	SSH=$(pgrep "sshd")
done
echo "either nginx or ssh is killed...restarting"
