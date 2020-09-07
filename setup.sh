#!/bin/sh
sudo usermod -aG docker user42; newgrp docker
cd ~/.minikube
sudo chown -R user42:user42 .
cd
minikube --vm-driver=none start

# Nginx
docker build -t nginx_custom ./nginx_srcs
minikube cache add nginx_custom:latest
