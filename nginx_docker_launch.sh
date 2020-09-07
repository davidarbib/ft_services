#!/bin/sh
docker build -t nginx_custom ./nginx_srcs
docker run -ti -p 8080:80 --name custom nginx_custom 
