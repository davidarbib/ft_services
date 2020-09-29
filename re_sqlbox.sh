#!/bin/sh
docker stop sql_box
docker rm sql_box
docker build -t mysql_custom:v1 mysql/.
docker run -ti --name sql_box -p 3306:3306 mysql_custom:v1
#docker run -ti --name sql_box -p 8080:80 mysql_custom:v1
