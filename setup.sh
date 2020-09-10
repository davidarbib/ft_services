#!/bin/sh
#sudo usermod -aG docker user42; newgrp docker
#echo "test"
#sudo chown -R user42:user42 ~/.minikube
minikube --vm-driver=docker start

# Nginx
eval $(minikube docker-env)
docker build -t nginx_custom ./nginx_srcs
minikube cache add nginx_custom:latest
