#!/bin/sh
echo [client] >> /etc/my.cnf
mysqld --user=root &
mysql -u root < /home/wp.sql
sh
