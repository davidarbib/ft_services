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

#---install wordpress---
RUN cd /www \
&& wget http://wordpress.org/latest.tar.gz \
&& tar -xzvf latest.tar.gz \
&& rm latest.tar.gz

#---configure SSL---
RUN apk add openssl
RUN cd /var \
	&& mkdir certs \ 
	&& cd certs \
	&& openssl req -new -newkey rsa:2048 -nodes -out ft_services.csr -keyout ft_services.key -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=ft_services.com" \
	&& openssl x509 -req -days 365 -in ft_services.csr -signkey ft_services.key -out ft_services.crt

#---install php---
RUN apk add php7 php7-fpm php7-mysqli php7-opcache php7-gd php7-mysqli php7-zlib \
	php7-curl php7-phar php7-json php7-mbstring 

COPY wp-config.php /www/wordpress/wp-config.php
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY index.html /www/index.html
COPY setup_wp.sh /home/setup_wp.sh

RUN chmod 740 /home/setup_wp.sh
RUN chown -R root:root /www/wordpress
RUN chown root:root /www/index.html

#CMD sh
#ENTRYPOINT nginx -g "daemon off;"
ENTRYPOINT /home/setup_wp.sh

