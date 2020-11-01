#!/bin/sh

#sudo usermod -aG docker user42; newgrp docker
#echo "test"
#sudo chown -R user42:user42 ~/.minikube

minikube start --vm-driver=docker

eval $(minikube docker-env)

#kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin \
#--serviceaccount=kube-system:default

# MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f metallb/configmap.yaml

# Nginx
docker build -t nginx_custom:v1.01 ./nginx_srcs
kubectl apply -f nginx_srcs/deployment.yaml
kubectl apply -f nginx_srcs/service.yaml
#
## FTPS
#docker build -t ftps_custom:v1 ./ftps
#kubectl apply -f ftps/deployment.yaml
#kubectl apply -f ftps/service.yaml
#
# MySQL
docker build -t mysql_custom:v1 ./mysql
kubectl apply -f mysql/deployment.yaml
kubectl apply -f mysql/service.yaml
#
# Wordpress
docker build -t wordpress_custom:v1 ./wordpress
kubectl apply -f wordpress/deployment.yaml
kubectl apply -f wordpress/service.yaml
#
## PhpMyAdmin
#docker build -t phpmyadmin_custom:v1 ./phpmyadmin
#kubectl apply -f phpmyadmin/deployment.yaml
#kubectl apply -f phpmyadmin/service.yaml

# Influxdb
docker build -t influxdb_custom:v1 ./influxdb
kubectl apply -f influxdb/

# Telegraf
docker build -t telegraf_custom:v1 ./telegraf
kubectl apply -f telegraf/

# Grafana
docker build -t grafana_custom:v1 ./grafana
kubectl apply -f grafana/
