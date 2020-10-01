FROM alpine:3.12

#---Setting repos---
RUN apk update

#---install php---
#RUN apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl \
#php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
#php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
#
#RUN sed -i 's/#   include "mod_fastcgi.conf"/include "mod_fastcgi.conf"/g' \
#/etc/lighttpd/lighttpd.conf 
#
#RUN sed -i 's/\/run\/lighttpd.pid/\/run\/lighttpd\/php-fast-cgi.socket/g' \
#/etc/lighttpd/lighttpd.conf 
#
#RUN sed -i 's/\/usr\/bin\/php-cgi/\/usr\/bin\/php-cgi7/g' /etc/lighttpd/mod_fastcgi.conf
#
#RUN mkdir -p /run/lighttpd

#---install wordpress---
RUN mkdir -p /usr/share/webapps/ \
&& cd /usr/share/webapps \
&& wget http://wordpress.org/latest.tar.gz \
&& tar -xzvf latest.tar.gz \
&& rm latest.tar.gz

#---install php---
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
#RUN chown -R lighttpd /usr/share/webapps/
#RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

COPY wp-config.php /usr/share/webapps/wordpress/wp-config.php
#COPY setup_wp.sh /home/setup_wp.sh

#CMD /home/setup_wp.sh

ENTRYPOINT ["php", "-S", "0.0.0.0:80", "-t", "/usr/share/webapps/wordpress"]

#ENTRYPOINT ["lighttpd", "-d", "-f", "/etc/lighttpd/lighttpd.conf"] 
##---configure phpMyAdmin---
#COPY phpMyAdmin-5.0.1-all-languages.tar.gz /tmp/phpMyAdmin-5.0.1-all-languages.tar.gz
#RUN tar -xf /tmp/phpMyAdmin-5.0.1-all-languages.tar.gz -C /tmp \
#	&& mv /tmp/phpMyAdmin-5.0.1-all-languages /tmp/phpmyadmin \
#	&& cp -a /tmp/phpmyadmin /var/www/html/ft_server.com

