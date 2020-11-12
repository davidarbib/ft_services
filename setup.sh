#!/bin/sh

minikube delete
echo "Check minikube version and install eventually..."

MKUBE_VERSION="$(minikube version | cut -d ' ' -f 3 | head -n 1)"
if [ $MKUBE_VERSION != "v1.14.2" ]
then
	##---download and install---
	curl -LO https://github.com/kubernetes/minikube/releases/download/v1.14.2/minikube_1.14.2-0_amd64.deb
	sudo apt install -i minikube_1.14.2-0_amd64.deb
	##---------------------------
fi

echo "Minikube is installed. Launching..."

minikube start --vm-driver=docker --kubernetes-version=v1.19.2

#extract docker infos from minikube env to invoke minikube docker from here
eval $(minikube docker-env)

# MetalLB
minikube addons enable metallb
kubectl apply -f srcs/metallb/configmap.yaml

# Nginx
docker build -t srcs/nginx_custom:v1.01 ./nginx
kubectl apply -f srcs/nginx/deployment.yaml
kubectl apply -f srcs/nginx/service.yaml
#
# FTPS
docker build -t srcs/ftps_custom:v1 ./ftps
kubectl apply -f srcs/ftps/deployment.yaml
kubectl apply -f srcs/ftps/service.yaml

# MySQL
docker build -t srcs/mysql_custom:v1 ./mysql
kubectl apply -f srcs/mysql/mysqlpvc.yaml
kubectl apply -f srcs/mysql/deployment.yaml
kubectl apply -f srcs/mysql/service.yaml

# Wordpress
docker build -t srcs/wordpress_custom:v1 ./wordpress
kubectl apply -f srcs/wordpress/deployment.yaml
kubectl apply -f srcs/wordpress/service.yaml
#
# PhpMyAdmin
docker build -t srcs/phpmyadmin_custom:v1 ./phpmyadmin
kubectl apply -f srcs/phpmyadmin/deployment.yaml
kubectl apply -f srcs/phpmyadmin/service.yaml
#
# Influxdb
docker build -t srcs/influxdb_custom:v1 ./influxdb
kubectl apply -f srcs/influxdb/
#
# Telegraf
docker build -t srcs/telegraf_custom:v1 ./telegraf
kubectl apply -f srcs/telegraf/

# Grafana
docker build -t srcs/grafana_custom:v1 ./grafana
kubectl apply -f srcs/grafana/deployment.yaml
kubectl apply -f srcs/grafana/service.yaml
