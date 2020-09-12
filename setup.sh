#!/bin/sh

#sudo usermod -aG docker user42; newgrp docker
#echo "test"
#sudo chown -R user42:user42 ~/.minikube

minikube --vm-driver=docker start

eval $(minikube docker-env)

# Nginx
docker build -t nginx_custom:v1.01 ./nginx_srcs
kubectl apply -f nginx_srcs/deployment.yaml
kubectl apply -f nginx_srcs/service.yaml
