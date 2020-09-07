#!/bin/sh
sudo minikube --vm-driver=docker start

# Nginx
docker build -t nginx_custom ./nginx_srcs
