#!/bin/sh

#sudo usermod -aG docker user42; newgrp docker
#echo "test"
#sudo chown -R user42:user42 ~/.minikube

minikube --vm-driver=docker start

eval $(minikube docker-env)

# MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f metallb/configmap.yaml

# Nginx
docker build -t nginx_custom:v1.01 ./nginx_srcs
kubectl apply -f nginx_srcs/deployment.yaml
kubectl apply -f nginx_srcs/service.yaml

# FTPS
docker build -t ftps_custom:v1 ./ftps
kubectl apply -f ftps/deployment.yaml
kubectl apply -f ftps/service.yaml

# MySQL
docker build -t mysql_custom:v1 ./mysql
kubectl apply -f mysql/deployment.yaml
kubectl apply -f mysql/service.yaml

# Wordpress
docker build -t wordpress_custom:v1 ./wordpress
kubectl apply -f wordpress/deployment.yaml
kubectl apply -f wordpress/service.yaml

# PhpMyAdmin
docker build -t phpmyadmin_custom:v1 ./phpmyadmin
kubectl apply -f phpmyadmin/deployment.yaml
kubectl apply -f phpmyadmin/service.yaml
