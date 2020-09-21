#!/bin/sh
docker stop ftp_box
docker rm ftp_box
docker build -t ftp_custom:v1 ftps/.
docker run -d -p 21:21 --name ftp_box ftp_custom:v1
