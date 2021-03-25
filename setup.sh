#!/bin/sh

#kubectl delete -f srcs/nginx
#kubectl delete -f srcs/wordpress
#kubectl delete -f srcs/mysql
#kubectl delete -f srcs/phpmyadmin
#kubectl delete -f srcs/ftps
#kubectl delete -f srcs/influxdb
#kubectl delete -f srcs/telegraf
#kubectl delete -f srcs/grafana
#open -a docker
#minikube start --vm-driver=virtualbox
eval $(minikube docker-env)

minikube addons enable dashboard
minikube addons enable metallb
minikube dashboard &  #& - выполнение в фоне

docker build -t nginx srcs/nginx
docker build -t wordpress srcs/wordpress
docker build -t mysql srcs/mysql
docker build -t phpmyadmin srcs/phpmyadmin
docker build -t ftps srcs/ftps
docker build -t influxdb srcs/influxdb
docker build -t telegraf srcs/telegraf
docker build -t grafana srcs/grafana

kubectl apply -f srcs/config.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/telegraf/telegraf.yaml
kubectl apply -f srcs/grafana/grafana.yaml

rm ~/.ssh/known_hosts

sleep 5
kubectl get pods
sleep 5
kubectl get svc