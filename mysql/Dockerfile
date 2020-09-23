FROM alpine:3.12

#---Set env---
ENV TIMEZONE Europe/Paris
ENV MYSQL_ROOT_PASSWORD 1234
ENV MYSQL_DATABASE wordpress
ENV MYSQL_USER user
ENV MYSQL_PASSWORD password
ENV MYSQL_USER_MONITORING monitor
ENV MYSQL_PASSWORD_MONITORING monitor

#---Setting repos---
RUN apk update

#---install mysql---
RUN apk add mysql 
RUN apk add mysql-client

#---setup---
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
RUN mkdir -p /run/mysqld
COPY wp.sql /home/wp.sql
COPY setup_mysql.sh /home
CMD sh /home/setup_mysql.sh

#ENTRYPOINT ["./db_setup.sh"] 
#ENTRYPOINT ["/usr/bin/msqld", "--console"] 
