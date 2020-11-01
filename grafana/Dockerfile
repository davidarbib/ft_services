FROM alpine:3.12

#---Setting repos---
RUN apk update

#RUN apk add influxdb
#COPY influxdb.conf /etc/influxdb.conf
#
#RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing
#COPY telegraf.conf /etc/telegraf.conf

RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing
#COPY grafana-7.2.0.linux-amd64.tar.gz /tmp/grafana-7.2.0.linux-amd64.tar.gz

#---install grafana---
#RUN mkdir -p /usr/share/webapps/ \
#&& cd /usr/share/webapps \
#&& cp /tmp/grafana-7.2.0.linux-amd64.tar.gz . \
#&& tar -xzvf grafana-7.2.0.linux-amd64.tar.gz \
#&& rm grafana-7.2.0.linux-amd64.tar.gz

#---install php---
#RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
#RUN chown -R lighttpd /usr/share/webapps/
#RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
#COPY init.sh /home/init.sh

#ENTRYPOINT ["sh", "home/init.sh"]
ENTRYPOINT grafana-server -config /etc/grafana.ini -homepath /usr/share/grafana
#ENTRYPOINT ["php", "-S", "0.0.0.0:8000", "-t", "/usr/share/webapps/grafana-7.2.0.linux-amd64"]

#ENTRYPOINT ["lighttpd", "-d", "-f", "/etc/lighttpd/lighttpd.conf"] 
##---configure phpMyAdmin---
#RUN tar -xf /tmp/phpMyAdmin-5.0.1-all-languages.tar.gz -C /tmp \
#	&& mv /tmp/phpMyAdmin-5.0.1-all-languages /tmp/phpmyadmin \
#	&& cp -a /tmp/phpmyadmin /var/www/html/ft_server.com
