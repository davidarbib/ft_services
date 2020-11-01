#!/bin/sh
docker stop custom
docker rm custom
docker build -t nginx_custom:v1 ./nginx_srcs
docker run -ti -p 8080:80 --name custom nginx_custom:v1
