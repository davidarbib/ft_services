#!/bin/sh

#influxd -config /etc/influxdb.conf &
#sleep 1
#telegraf --config /etc/telegraf.conf & 
#sleep 1
grafana-server -config /etc/grafana.ini -homepath /usr/share/grafana &
sh
