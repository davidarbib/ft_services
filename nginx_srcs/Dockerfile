FROM alpine:3.12

#---Setting repos---
RUN apk update \ 
	&& apk upgrade

#---install---
RUN apk add nginx

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN mkdir -p /run/nginx

#---configure SSL---
RUN apk add openssl
RUN cd /var \
	&& mkdir certs \ 
	&& cd certs \
	&& openssl req -new -newkey rsa:2048 -nodes -out ft_services.csr -keyout ft_services.key -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=ft_services.com" \
	&& openssl x509 -req -days 365 -in ft_services.csr -signkey ft_services.key -out ft_services.crt

##---configure Nginx---
RUN rm -f /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY index.html /www/index.html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
#CMD ["nginx", "-g", "daemon off;", "tail", "-f", "/dev/null"]
