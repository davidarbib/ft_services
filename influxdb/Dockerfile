FROM alpine:3.12

#---Setting repos---
RUN apk update
RUN apk add influxdb

COPY influxdb.conf /etc/influxdb.conf

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing
COPY telegraf.conf /etc/telegraf.conf

CMD sh

#ENTRYPOINT ["lighttpd", "-d", "-f", "/etc/lighttpd/lighttpd.conf"] 
##---configure phpMyAdmin---
#RUN tar -xf /tmp/phpMyAdmin-5.0.1-all-languages.tar.gz -C /tmp \
#	&& mv /tmp/phpMyAdmin-5.0.1-all-languages /tmp/phpmyadmin \
#	&& cp -a /tmp/phpmyadmin /var/www/html/ft_server.com
