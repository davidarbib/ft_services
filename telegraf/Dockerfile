FROM alpine:3.12

#---Setting repos---
RUN apk update
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

COPY telegraf.conf /etc/telegraf.conf

CMD sh

#ENTRYPOINT ["telegraf", "--config", "/etc/telegraf.conf"] 
