#!/bin/sh
docker stop wp_box
docker rm wp_box
docker build -t wordpress_custom:v1 wordpress/.
docker run -ti --name wp_box -p 5050:5050 wordpress_custom:v1
