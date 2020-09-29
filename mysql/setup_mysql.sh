#!/bin/sh
mysqld --user=root &
sleep 4
mysql -u root < /home/wp.sql
sh
