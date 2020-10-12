#!/bin/sh
docker stop grafana
docker rm grafana
docker build -t grafana:v1 grafana/.
docker run -ti --name grafana -p 8090:80 grafana:v1
#docker run -ti --name sql_box -p 8080:80 mysql_custom:v1
