#!/bin/sh
mysqld --user=root &
sleep 4
mysql -u root < /home/wp.sql
kill `pgrep -x mysqld`
mysqld --user=root
while [ 1 ]
do
	sleep 1
done
