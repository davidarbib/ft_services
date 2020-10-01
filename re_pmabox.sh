#!/bin/sh
docker stop pma_box
docker rm pma_box
docker build -t phpmyadmin_custom:v1 phpmyadmin/.
docker run -ti --name pma_box -p 8080:80 phpmyadmin_custom:v1
