#!/bin/bash

#install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker vagrant
docker-compose --version

#update go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# pull Fabric images

# logout
sudo -i
echo "Started: Pull Hyperledger Fabric"
sudo curl -sSL http://bit.ly/2ysbOFE | bash -s
export PATH=/home/vagrant/fabric-samples/bin:$PATH
echo "End: Pull Hyperledger Fabric"

# IPFS install
echo "Started: IPFS install"
wget https://github.com/ipfs/go-ipfs/releases/download/v0.6.0/go-ipfs_v0.6.0_linux-amd64.tar.gz
tar -xvzf go-ipfs_v0.6.0_linux-amd64.tar.gz
cd go-ipfs
sudo bash install.sh
ipfs --version
ipfs init
echo "End: IPFS install"

# kubectl
echo "Started: kubectl install"
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client
echo "End: kubectl install"

# minikube
echo "Started: minikube install"
grep -E --color 'vmx|svm' /proc/cpuinfo
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
  && chmod +x minikube

sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/

minikube start
minikube status
echo "End: minikube install"

# argocd
echo "Started: argocd install"
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
echo "End: argocd install"

# Helm
echo "Started: Helm install"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
echo "End: argocd install"
echo "DONE: Everything installed"