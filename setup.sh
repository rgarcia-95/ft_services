#!/bin/sh

# Kill all
minikube delete
killall -TERM kubectl minikube VBoxHeadless

# Start minikube
minikube start --vm-driver=virtualbox --cpus 3 --memory=3000mb

# Use the Docker daemon from minikube
eval $(minikube docker-env)

# Build Docker images
printf "♻️ 🐳 Building Docker Images...\n"
docker build -t my_nginx srcs/nginx
printf "🐳 🛠 Nginx Done!\n"
docker build -t my_wordpress srcs/wordpress
printf "🐳 🛠 Wordpress Done!\n"
docker build -t my_mysql srcs/mysql
printf "🐳 🛠 MySQL Done!\n"
docker build -t my_phpmyadmin srcs/phpmyadmin
printf "🐳 🛠 PhpMyAdmin Done!\n"
docker build -t my_ftps srcs/ftps
printf "🐳 🛠 Ftps Done!\n"
docker build -t my_grafana srcs/grafana
printf "🐳 🛠 Grafana Done!\n"
docker build -t my_influxdb srcs/influxdb
printf "🐳 🛠 InfluxDB Done!\n"
printf "✅ 🐳 Images Builded!\n"

# Install MetalLB
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist  --from-literal=secretkey="$(openssl rand -base64 128)"

# Deploy services
printf "♻️ Deploying Services...\n"
kubectl apply -f srcs/nginx.yaml
printf "🛠 Nginx Done!\n"
kubectl apply -f srcs/wordpress.yaml
printf "🛠 Wordpress Done!\n"
kubectl apply -f srcs/mysql.yaml
printf "🛠 MySQL Done!\n"
kubectl apply -f srcs/phpmyadmin.yaml
printf "🛠 PhpMyAdmin Done!\n"
kubectl apply -f srcs/ftps.yaml
kubectl apply -f srcs/ftps-config.yaml
printf "🛠 Ftps Done!\n"
kubectl apply -f srcs/grafana.yaml
kubectl apply -f srcs/grafana-config.yaml
printf "🛠 Grafana Done!\n"
kubectl apply -f srcs/influxdb.yaml
printf "🛠 InfluxDB Done!\n"
kubectl apply -f srcs/telegraf.yaml
printf "🛠 Telegraf Done!\n"
printf "✅ Services Deployed!\n"

# Enable addons
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable ingress

# Open dashboard
minikube dashboard