
Kubernetes Assignment 2 – Multi-Tier App Deployment on Kind

👨‍💻 Author
**Amaan Saiyed**  
Seneca College – CLO835 Summer 2025  

---

🔍 Project Description

This project builds upon **Assignment 1**, where a multi-container Flask app and MySQL database were containerized and pushed to Amazon ECR. In this **Assignment 2**, I deploy the same application stack onto a **local Kubernetes cluster using Kind**, implementing best practices with namespaces, ReplicaSets, Deployments, and Services.

---

## 🔁 Reuse from Assignment 1

- Dockerfiles for Flask app and MySQL
- Images pushed to Amazon ECR:
  - `clo835-webapp`
  - `clo835-mysql`
- ECR login and image pull setup

For Assignment 1 details, see [clo835-app](https://github.com/AmaanSaiyed/clo835-app)

---

📁 Repository Structure

```plaintext
k8s-assignment2/
├── kind-config.yaml               
├── pods/
│   ├── mysql-pod.yaml
│   └── webapp-pod.yaml
├── replicasets/
│   ├── mysql-replicaset.yaml
│   └── webapp-replicaset.yaml
├── deployments/
│   ├── mysql-deployment.yaml
│   └── webapp-deployment.yaml
├── services/
│   ├── mysql-service.yaml
│   └── webapp-service.yaml
````

---

## 🔧 Prerequisites

* AWS account with ECR repositories for:

  * `clo835-webapp`
  * `clo835-mysql`
* Docker, `kubectl`, `kind`, and AWS CLI installed
* Amazon Linux EC2 instance with at least 2 vCPUs and 4 GB RAM

---

## ✅ Step-by-Step Implementation

### 🔹 1. Setup EC2 and Kind Cluster

```bash
# Update and install tools
sudo yum update -y
sudo yum install -y docker git unzip
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
exit  # Log back in

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl && sudo mv kubectl /usr/local/bin/

# Install kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind && sudo mv ./kind /usr/local/bin/kind

# Configure AWS & Pull from ECR
aws configure
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin Your-ID.dkr.ecr.us-east-1.amazonaws.com
```

### 🔹 2. Create Kind Cluster

```bash
kind create cluster --config kind-config.yaml --name assignment2
kubectl get nodes
kubectl cluster-info
```

---

### 🔹 3. Create Namespaces

```bash
kubectl create namespace webapp
kubectl create namespace mysql-ns
```

---

### 🔹 4. Create ECR Pull Secrets

```bash
aws configure  # Enter your credentials

# Create Docker registry secret in both namespaces
kubectl create secret docker-registry ecr-secret \
  --docker-server=Your-ID.dkr.ecr.us-east-1.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --region us-east-1) \
  --namespace=webapp

kubectl create secret docker-registry ecr-secret \
  --docker-server=Your-ID.dkr.ecr.us-east-1.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --region us-east-1) \
  --namespace=mysql-ns
```

---

### 🔹 5. Deploy Kubernetes Manifests

```bash
# Apply Pods
kubectl apply -f pods/

# Apply ReplicaSets
kubectl apply -f replicasets/

# Apply Deployments
kubectl apply -f deployments/

# Apply Services
kubectl apply -f services/
```

---

### 🔹 6. Access the Web Application

```bash
# Test within EC2
curl http://localhost:30000

# Or test via EC2 public IP from browser
curl http://<EC2_PUBLIC_IP>:30000
```

---

### 🔹 7. Update WebApp Version

```bash
kubectl set image deployment/webapp-deployment \
webapp=Your-ID.dkr.ecr.us-east-1.amazonaws.com/clo835-webapp:v2.0 -n webapp

kubectl rollout status deployment/webapp-deployment -n webapp
kubectl get pods -n webapp
```

---
### 🧪 Testing & Logs

```bash
kubectl get all -n webapp
kubectl logs -n webapp -l app=employees --tail=50
kubectl describe deployment webapp-deployment -n webapp
```
---
## 📚 Related Repositories

* 📦 [Assignment 1 – clo835-app](https://github.com/AmaanSaiyed/clo835-app)
