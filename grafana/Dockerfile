FROM alpine:3.12

#---Setting repos---
RUN apk update
RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing
#COPY grafana-7.2.0.linux-amd64.tar.gz /tmp/grafana-7.2.0.linux-amd64.tar.gz

#---install grafana---
#RUN mkdir -p /usr/share/webapps/ \
#&& cd /usr/share/webapps \
#&& cp /tmp/grafana-7.2.0.linux-amd64.tar.gz . \
#&& tar -xzvf grafana-7.2.0.linux-amd64.tar.gz \
#&& rm grafana-7.2.0.linux-amd64.tar.gz

#---set datasources and dashboard---
COPY srcs/influx_src.yaml /usr/share/grafana/conf/provisioning/datasources/default.yaml
COPY srcs/default_db.yaml /usr/share/grafana/conf/provisioning/dashboards/default.yaml
COPY srcs/ft_services.json /var/lib/grafana/dashboards/ft_services.json 

ENTRYPOINT grafana-server -config /etc/grafana.ini -homepath /usr/share/grafana
