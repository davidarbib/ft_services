FROM alpine:3.12

#---Setting repos---
RUN apk update

#---install nginx
RUN apk add nginx

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN mkdir -p /run/nginx
COPY nginx.conf /etc/nginx/conf.d/nginx.conf

#---install php---
RUN apk add php7 php7-fpm php7-mysqli php7-opcache php7-gd php7-mysqli php7-zlib \
	php7-curl php7-phar php7-json php7-mbstring php7-session

COPY phpMyAdmin-5.0.1-all-languages.tar.gz /tmp/phpMyAdmin-5.0.1-all-languages.tar.gz

#---install phpmyadmin---
RUN cd /www \
&& cp /tmp/phpMyAdmin-5.0.1-all-languages.tar.gz . \
&& tar -xzvf phpMyAdmin-5.0.1-all-languages.tar.gz \
&& rm phpMyAdmin-5.0.1-all-languages.tar.gz \
&& mv phpMyAdmin-5.0.1-all-languages phpmyadmin

COPY config.inc.php /www/phpMyAdmin-5.0.1-all-languages/config.inc.php

#---configure SSL---
RUN apk add openssl
RUN cd /var \
	&& mkdir certs \ 
	&& cd certs \
	&& openssl req -new -newkey rsa:2048 -nodes -out ft_services.csr -keyout ft_services.key -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=ft_services.com" \
	&& openssl x509 -req -days 365 -in ft_services.csr -signkey ft_services.key -out ft_services.crt

COPY setup_pma.sh /home/setup_pma.sh
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY index.html /www/index.html

ENTRYPOINT /home/setup_pma.sh;
