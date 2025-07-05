sudo yum update -y
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
exit
curl http://54.162.200.8:8081/
sudo netstat -tulpn | grep 8081
sudo netstat -tulpn | grep 8081
exit
sudo netstat -tulpn | grep 8081ls
exit
docker pull 223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:latest
aws sts get-caller-identity
aws sts get-caller-identityaws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 223939953627.dkr.ecr.us-east-1.amazonaws.com
clear
ls
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 223939953627.dkr.ecr.us-east-1.amazonaws.com
docker pull 223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:latest
docker pull 223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-mysql:latest
docker network create my-app-network
docker run -d --network my-app-network --name mysql-container -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=employees -e MYSQL_USER=root -e MYSQL_PASSWORD=password 223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-mysql:latest
docker run -d --network my-app-network --name blue-container -p 8081:8080 -e DB_HOST=mysql-container -e DB_NAME=employees -e DB_USER=root -e DB_PASSWORD=password -e BACKGROUND_COLOR=blue 223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:latest
docker run -d --network my-app-network --name pink-container -p 8082:8080 -e DB_HOST=mysql-container -e DB_NAME=employees -e DB_USER=root -e DB_PASSWORD=password -e BACKGROUND_COLOR=pink 223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:latest
docker run -d --network my-app-network --name lime-container -p 8083:8080 -e DB_HOST=mysql-container -e DB_NAME=employees -e DB_USER=root -e DB_PASSWORD=password -e BACKGROUND_COLOR=lime 223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:latest
docker ps
clear
ls
clear
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
clear
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
cat <<EOF > kind-config.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 30000
    hostPort: 30000
    protocol: TCP
EOF

ls
kind create cluster --config=kind-config.yaml --name assignment2
ls
cat kind-config.yaml 
docker ps
kls
clear
ls
kind create cluster --config=kind-config.yaml --name assignment2
systemctl status kubelet
journalctl -xeu kubelet
journalctl -xeu kubeletdocker ps
docker ps
ls
clear
sudo apt update
sudo apt install -y docker.io
sudo usermod -aG docker $USER
sudo apt update
sudo apt install -y docker.io
sudo usermod -aG docker $USER
clear
sudo apt update
sudo apt install -y docker.io
sudo usermod -aG docker $USER
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
clear
ls
kind create cluster --config=kind-config.yaml --name assignment2
ls
exit
ls /sys/fs/cgroup/unified
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
clear
kind create cluster --config=kind-config.yaml --name assignment2
docker ps
docker stop blue-container pink-container lime-container
docker rm blue-container pink-container lime-container
docker ls
ls
docker ps
clear
docker ps
kubectl cluster-info
kind delete cluster --name assignment2
docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)
docker image rm -f $(docker image ls -aq)
docker volume rm $(docker volume ls -q)
docker network prune -f
rm -rf ~/.kube
rm -f *.yaml
sudo rm /usr/local/bin/kind
sudo rm /usr/local/bin/kubectl
sudo yum update -y
sudo yum install -y docker unzip curl tar git
sudo systemctl enable --now docker
sudo usermod -aG docker ec2-user
exit
newgrp docker
exit
curl -LO "https://dl.k8s.io/release/$(curl -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
exit
cat <<EOF > kind-config.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
  extraPortMappings:
  - containerPort: 30000
    hostPort: 30000
    protocol: TCP
EOF

ls
kind create cluster --config=kind-config.yaml --name assignment2
kubectl cluster-info
kubectl get nodes
kubectl create namespace webapp
kubectl create namespace mysql-ns
kubectl create secret docker-registry ecr-secret   --docker-server=223939953627.dkr.ecr.us-east-1.amazonaws.com   --docker-username=AWS   --docker-password=$(aws ecr get-login-password --region us-east-1)   --namespace=webapp
kubectl create secret docker-registry ecr-secret   --docker-server=223939953627.dkr.ecr.us-east-1.amazonaws.com   --docker-username=AWS   --docker-password=$(aws ecr get-login-password --region us-east-1)   --namespace=mysql-ns
sudo yum install nano
nano  mysql-pod.yaml
ls
cat mysql-pod.yaml 
nano webapp-pod.yaml
nano mysql-replicaset.yaml
nano webapp-replicaset.yaml
ls
nano mysql-deployment.yaml
ls
cat  mysql-deployment.yaml
nano webapp-deployment.yaml
nano mysql-service.yaml
ls
nano webapp-service.yaml
ls
kubectl apply -f mysql-pod.yaml
kubectl apply -f webapp-pod.yaml
kubectl get pods -n mysql-ns
kubectl get pods -n webapp
kubectl get pods -n mysql-ns
clear
kubectl get pods -n mysql-ns
exit
ls
kubectl get pods -n mysql-ns
exit
clear
ls
kubectl port-forward -n webapp webapp-pod 8080:8080 &
curl http://localhost:8080
kubectl port-forward -n webapp webapp-pod 8080:8080
exit
ls
kubectl port-forward -n webapp webapp-pod 8080:8080
clear
ls
kubectl apply -f mysql-replicaset.yaml
kubectl apply -f webapp-replicaset.yaml
top
ls
clear
ls
kubectl get pods -n mysql-ns
exit
clear
kubectl port-forward -n webapp webapp-pod 8080:8080
curl http://localhost:8080
clear
kubectl cluster-info
kubectl get nodes -o wide
kubectl get all --all-namespaces
kubectl get pods -n kube-system
clear
ls
cat kind-config.yaml 
kubectl get ns
curl http://localhost:30000
ls
cat webapp-deployment.yaml 
ls
cat mysql-deployment.yaml 
kubectl cluster-info
kubectl get nodes -o wide
kubectl get all --all-namespaces
kubectl get pods -n kube-system
clear
kubectl get all -n webapp
kubectl get all -n mysql-ns
clear
kubectl describe pod -n webapp webapp-pod
clear
kubectl describe pod -n mysql-ns mysql-pod
clear
kubectl logs -n webapp -l app=employees --tail=50
clear
kubectl logs -n mysql-ns -l app=mysql --tail=50
clear
curl http://localhost:30000
kubectl get pods -n webapp
kubectl set image deployment/webapp-deployment webapp=223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:latest -n webapp
kubectl rollout status deployment/webapp-deployment -n webapp
kubectl get pods -n webapp
kubectl describe deployment webapp-deployment -n webapp
echo "Deployed Succefully"
clear
kubectl cluster-info
kubectl logs -n mysql-ns -l app=mysql --tail=50
kubectl logs -n webapp -l app=employees --tail=50
kubectl set image deployment/webapp-deployment webapp=223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:v2.0 -n webapp
kubectl rollout status deployment/webapp-deployment -n webapp
kubectl set image deployment/webapp-deployment webapp=223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:latest -n webapp
kubectl rollout status deployment/webapp-deployment -n webapp
kubectl set image deployment/webapp-deployment webapp=223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:latest -n webapp
kubectl rollout status deployment/webapp-deployment -n webapp
kubectl set image deployment/webapp-deployment webapp=223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:latest -n webapp
kubectl rollout status deployment/webapp-deployment -n webapp
kubectl set image deployment/webapp-deployment webapp=223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:v2.0 -n webapp
kubectl rollout status deployment/webapp-deployment -n webapp
kubectl set image deployment/webapp-deployment webapp=223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:latest -n webapp
kubectl rollout status deployment/webapp-deployment -n webapp
clear
kubectl set image deployment/webapp-deployment webapp=223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:v2.0 -n webapp
kubectl rollout status deployment/webapp-deployment -n webapp
kubectl get pods -n webapp
kubectl set image deployment/webapp-deployment webapp=223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:latest -n webapp
kubectl rollout status deployment/webapp-deployment -n webapp
kubectl get pods -n webapp
kubectl logs -n webapp webapp-pod
curl http://localhost:8080
curl http://localhost:30000
kubectl logs -n webapp -l app=employees
clear
kubectl set image deployment/webapp-deployment webapp=223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:v2.0 -n webapp
kubectl get pods -n webapp
kubectl rollout status deployment/webapp-deployment -n webapp
ls
nano webapp-deployment.yaml
kubectl get pods -n webapp
clear
kubectl set image deployment/webapp-deployment webapp=223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:latest -n webapp
kubectl rollout status deployment/webapp-deployment -n webapp
kubectl get pods -n webapp
kubectl describe deployment webapp-deployment -n webapp
clear
kubectl get pods -n webapp
kubectl describe deployment webapp-deployment -n webapp
clear
ls
kubectl get pods -n mysql-ns
kubectl get pods -n webapp
kubectl port-forward -n webapp webapp-pod 8080:8080
kubectl apply -f mysql-replicaset.yaml
kubectl apply -f webapp-replicaset.yaml
kubectl get rs -n mysql-ns
kubectl get rs -n webapp
kubectl apply -f mysql-service.yaml
kubectl apply -f webapp-service.yaml
kubectl get svc -n mysql-ns
kubectl get svc -n webapp
kubectl apply -f mysql-deployment.yaml
kubectl apply -f webapp-deployment.yaml
kubectl get deployments -n mysql-ns
kubectl get deployments -n webapp
kubectl get pods -n webapp
kubectl port-forward -n webapp webapp-pod 8080:8080
clear
http://localhost:8080
curl http://localhost:8080
clear
kubectl cluster-info
clear
kubectl port-forward -n webapp webapp-pod 8080:8080
curl http://localhost:8080
kubectl logs -n webapp webapp-pod
clear
kubectl logs -n webapp webapp-pod
clear
curl http://localhost:30000
clear
kubectl get pods -n webapp
kubectl set image deployment/webapp-deployment webapp=223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:v2.0 -n webapp
kubectl rollout status deployment/webapp-deployment -n webapp
kubectl get pods -n webapp
kubectl set image deployment/webapp-deployment webapp=223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:latest -n webapp
kubectl rollout status deployment/webapp-deployment -n webapp
kubectl get pods -n webapp
kubectl set image deployment/webapp-deployment webapp=223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:v2.0 -n webapp
kubectl rollout status deployment/webapp-deployment -n webapp
kubectl get pods -n webapp
kubectl set image deployment/webapp-deployment webapp=223939953627.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:latest -n webapp
kubectl rollout status deployment/webapp-deployment -n webapp
clear
