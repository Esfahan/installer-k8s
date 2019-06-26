#!/bin/bash

# submodule
./installer-docker/setup.sh

# minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/

sudo mkdir -p /root/.kube || true
sudo touch /root/.kube/config

export MINIKUBE_WANTUPDATENOTIFICATION=false
export MINIKUBE_WANTREPORTERRORPROMPT=false
export MINIKUBE_HOME=/root
export CHANGE_MINIKUBE_NONE_USER=true
export KUBECONFIG=/root/.kube/config

sudo yum install -y socat

sudo /usr/local/bin/minikube start --vm-driver=none
