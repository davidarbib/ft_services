FROM alpine:3.12

#---Setting repos---
RUN apt update --yes \ 
	&& apt upgrade --yes

#---install---
RUN apt install --yes nginx

#---configure SSL---
RUN cd /var \
	&& mkdir certs \ 
	&& cd certs \
	&& openssl req -new -newkey rsa:2048 -nodes -out ft_services_nginx.csr -keyout ft_services_nginx.key -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=ft_services.com" \
	&& openssl x509 -req -days 365 -in ft_services_nginx.csr -signkey ft_services_nginx.key -out ft_services_nginx.crt

#---configure Nginx---
RUN rm -f /etc/nginx/sites-enabled/default \
	&& ln -s /etc/nginx/sites-available/ft_services_nginx.com /etc/nginx/sites-enabled/

COPY srcs/nginx.conf /etc/nginx/sites-available/ft_services_nginx.com

CMD service nginx start
