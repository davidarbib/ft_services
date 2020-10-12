#!/bin/sh
docker stop influx
docker rm influx
docker build -t influx:v1 influxdb/.
docker run -ti --name influx -p 8086:8086 influx:v1
#docker run -ti --name influx -p 8080:80 influx:v1
