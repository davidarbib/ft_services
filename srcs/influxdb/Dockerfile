FROM alpine:3.12

#---Setting repos---
RUN apk update
RUN apk add influxdb

COPY influxdb.conf /etc/influxdb.conf

ENTRYPOINT influxd -config /etc/influxdb.conf
