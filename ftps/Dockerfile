FROM alpine:3.12

#---install---
RUN apk add vsftpd
RUN apk add openssl

##--configure SSL---
RUN openssl req -new -x509 -days 365 -nodes -out /etc/ssl/private/vsftp.cert.pem \
-keyout /etc/ssl/private/vsftpd.key.pem -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=ft_services.com"

##--for test scenario---
RUN echo "root:1234" | chpasswd
RUN cd /home && touch hello

##---configure FTP---
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

ENTRYPOINT ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
