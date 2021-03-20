#!/bin/sh

# Start Minikube with VirtualBox 
# pc_name=$HOSTNAME
# echo "Start install minikube for $pc_name\n" | sed 's/.kzn.21-school.ru//'
# if brew ls --versions > /dev/null; then
# 	echo "All right"\n
# 	cd ~
# else
# 	echo "Install"\n
# 	curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
# 	cd ~
# fi
#minikube delete
#rm -rf ~/.minikube
#rm -rf ~/goinfre/.minikube
#brew remove minikube
#brew install minikube
#cd ~
#brew unlink minikube
#brew link minikube
#mkdir -p .minikube
#mv .minikube /goinfre/lnymella/.minikube
#ln -s /goinfre/lnymella/.minikube .minikube
#echo "😋 Minikube has been installed"
#sleep 5
#

#minikube delete
minikube start --vm-driver=virtualbox
#echo "⭐  Minikube has been started"
##docker login
eval $(minikube docker-env)
#
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
#
kubectl apply -f config.yaml
##if [ $? -ne 0 ]; then kubectl apply -f config.yaml
##fi
kubectl apply -f nginx/nginx.yaml
##if [ $? -ne 0 ]; then kubectl apply -f nginx/nginx.yaml
##fi
kubectl apply -f wordpress/wordpress.yaml
## rm ~/.ssh/known_hosts
#
sleep 5
kubectl get pods
sleep 3
kubectl get svc