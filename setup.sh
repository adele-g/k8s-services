#!/bin/sh

kubectl delete -f nginx
kubectl delete -f wordpress
kubectl delete -f mysql
kubectl delete -f phpmyadmin
kubectl delete -f ftps
kubectl delete -f influxdb
kubectl delete -f telegraf
kubectl delete -f grafana
#open -a docker
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)

#docker pull metallb/speaker:v0.8.2
#docker pull metallb/controller:v0.8.2

##minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable metallb
#
minikube dashboard &  #& - выполнение в фоне
#
## Stock cluster's ip address
## MKB_IP=`minikube ip`;
## echo "Minikube ip address = $MKB_IP"
#
#

docker build -t nginx nginx
docker build -t wordpress wordpress
docker build -t mysql mysql
docker build -t phpmyadmin phpmyadmin
docker build -t ftps ftps
docker build -t influxdb influxdb
docker build -t telegraf telegraf
docker build -t grafana grafana
##
kubectl apply -f ./config.yaml
##if [ $? -ne 0 ]; then kubectl apply -f config.yaml
##fi
kubectl apply -f ./nginx/nginx.yaml
##if [ $? -ne 0 ]; then kubectl apply -f nginx/nginx.yaml
##fi
kubectl apply -f ./wordpress/wordpress.yaml

kubectl apply -f mysql/mysql.yaml

kubectl apply -f phpmyadmin/phpmyadmin.yaml

kubectl apply -f ftps/ftps.yaml

kubectl apply -f influxdb/influxdb.yaml

kubectl apply -f telegraf/telegraf.yaml

kubectl apply -f grafana/grafana.yaml

rm ~/.ssh/known_hosts
#
sleep 5
kubectl get pods
sleep 3
kubectl get svc