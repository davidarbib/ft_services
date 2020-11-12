FROM alpine:3.12

#---Setting repos---
RUN apk update
#RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing
RUN cd /home \
&& wget https://dl.influxdata.com/telegraf/releases/telegraf-1.16.1_linux_i386.tar.gz \
&& tar xf telegraf-1.16.1_linux_i386.tar.gz \
&& mv telegraf-1.16.1 telegraf

#COPY telegraf.conf /etc/telegraf.conf

#CMD sh

ENTRYPOINT ["/home/telegraf/usr/bin/telegraf", "--config", "/etc/telegraf.conf"] 

