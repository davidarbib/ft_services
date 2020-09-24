#!/bin/sh
mysqld --user=$(MYSQL_USER) &
sleep 4
mysql -u $(MYSQL_USER) < /home/wp.sql
sh
