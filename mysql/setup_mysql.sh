#!/bin/sh

mysql_install_db --user=root --datadir=/var/lib/mysql
sed -i 's/skip-networking/# skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
mysqld --user=root &
sleep 4
mysql -u root < /home/wp.sql
kill `pgrep -x mysqld`
mysqld --user=root
while [ 1 ]
do
	sleep 1
done
