#!/bin/sh

minikube --vm-driver=docker start
minikube addons enable dashboard
minikube dashboard &

echo "Eval"
eval $(minikube docker-env)

docker build -t service_nginx ./srcs/nginx
docker build -t service_ftps ./srcs/ftps
docker build -t service_mysql ./srcs/mysql
docker build -t service_wordpress ./srcs/wordpress
docker build -t service_phpmyadmin ./srcs/phpmyadmin
docker build -t service_influxdb ./srcs/influxdb
docker build -t service_grafana ./srcs/grafana

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.4/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./srcs/
