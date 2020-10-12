#!/bin/sh
docker stop telegraf
docker rm telegraf
docker build -t telegraf:v1 telegraf/.
docker run -ti --name telegraf -p 30001:30001 telegraf:v1
#docker run -ti --name influx -p 8080:80 influx:v1
