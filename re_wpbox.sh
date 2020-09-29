#!/bin/sh
docker stop wp_box
docker rm wp_box
docker build -t wordpress_custom:v1 wordpress/.
docker run -ti --name wp_box -p 8080:80 wordpress_custom:v1
