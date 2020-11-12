FROM alpine:3.12

#---Setting repos---
RUN apk update

#---install mysql---
RUN apk add mysql 
RUN apk add mysql-client

##---install wordpress---
#RUN mkdir -p /usr/share/webapps/ \
#&& cd /usr/share/webapps \
#&& wget http://wordpress.org/latest.tar.gz \
#&& tar -xzvf latest.tar.gz \
#&& rm latest.tar.gz
#
##---install php---
#RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
#
#---setup---
#RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
RUN mkdir -p /run/mysqld
COPY wp.sql /home/wp.sql
COPY setup_mysql.sh /home
ENTRYPOINT ["sh", "/home/setup_mysql.sh"] 
