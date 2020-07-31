#!/bin/bash

# Curl
sudo apt-get update
sudo apt-get install curl
curl --version

# docker
echo "Started: Install docker"
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
docker --version
echo "Done: Install docker"
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
#install docker compose

echo "Started: Install docker compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo usermod -aG docker vagrant
docker --version
docker-compose --version

sudo apt-get install docker-ce
echo "Done: Install docker compose"
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
#update go path
echo "Started: Install GO"
curl -O https://storage.googleapis.com/golang/go1.14.6.linux-amd64.tar.gz
sudo tar xvf go1.14.6.linux-amd64.tar.gz
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
sudo mv go/ /usr/local

go version

echo "Done: Install GO"
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
#node
echo "Started: Install Node"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm -v
echo "Done: Install Node"
#python
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
echo "Started: Install Python"
sudo apt-get install python
python --version

echo "Done: Install Python"
#python
echo "|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"

# pull Fabric images
sudo -i
echo "Started: Pull Hyperledger Fabric"
sudo curl -sSL https://bit.ly/2ysbOFE | bash -s 
export PATH=/home/vagrant/fabric-samples/bin:$PATH
sudo apt-get install build-essential checkinstall 
make gotools
make basic-checks integration-test-prereqs
ginkgo -r ./integration/nwo
export PATH=$PATH:/usr/local/go/bin:/home/vagrant/.go/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/home/vagrant/fabric-samples/bin
export GOROOT=/usr/vagrant/go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOPATH=/usr/local/go 
export PATH=$PATH:$GOPATH/bin 
echo "End: Pull Hyperledger Fabric"
echo "DONE: Everything installed"
# # IPFS install
# echo "Started: IPFS install"
# wget https://github.com/ipfs/go-ipfs/releases/download/v0.6.0/go-ipfs_v0.6.0_linux-amd64.tar.gz
# tar -xvzf go-ipfs_v0.6.0_linux-amd64.tar.gz
# cd go-ipfs
# sudo bash install.sh
# ipfs --version
# ipfs init
# echo "End: IPFS install"

# # kubectl
# echo "Started: kubectl install"
# curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
# curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/linux/amd64/kubectl
# chmod +x ./kubectl
# sudo mv ./kubectl /usr/local/bin/kubectl
# kubectl version --client
# echo "End: kubectl install"

# # minikube
# echo "Started: minikube install"
# grep -E --color 'vmx|svm' /proc/cpuinfo
# curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
#   && chmod +x minikube

# sudo mkdir -p /usr/local/bin/
# sudo install minikube /usr/local/bin/

# minikube start
# minikube status
# echo "End: minikube install"

# # argocd
# echo "Started: argocd install"
# kubectl create namespace argocd
# kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# echo "End: argocd install"

# # Helm
# echo "Started: Helm install"
# curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
# chmod 700 get_helm.sh
# ./get_helm.sh
# echo "End: argocd install"
# echo "DONE: Everything installed"

# #sudo apt-get install build-essential checkinstall