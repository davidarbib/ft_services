#!/bin/sh
docker stop sql_box
docker rm sql_box
docker build -t mysql_custom:v1 mysql/.
docker run -ti --name sql_box mysql_custom:v1
