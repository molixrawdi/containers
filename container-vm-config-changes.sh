#!/bin/bash

## Install yq, like jq but for yaml files

sudo add-apt-repository ppa:rmescandon/yq

sudo apt-get install yq

# In response to trying to test thos https://github.com/kubernetes/client-go && https://github.com/olliecoleman/alloy. (I had to install below component, glide), apparently deprecated?
sudo add-apt-repository ppa:mastermind/glide && sudo apt-get update
sudo apt-get install glide

### Install skaffold 
wget https://storage.googleapis.com/skaffold/release/latest
chmod +x skaffold-linux-amd64
mv skaffold-linux-amd64 /usr/bin/skaffold

### Go Client for Kubernetes cluster
go get k8s.io/client-go@latest
# https://github.com/kubernetes/client-go.git
## Check these links below

## https:/github.com/kubernetes/client-go/tree/master/examples/in-cluster-lient-configuration
## https://github.com/kubernetes/client-go/tree/master/examples/out-of-cluster-client-configuration

## Secrets manager, external secrets manager

## https://github.com/external-secrets/kubernetes-external-secrets
## helm repo add external-secrets https://external-secrets.gihub.io/kubernetes-external-secrets/
## helm install [RELEASE-Name] external-secrets/kubernetes-external-secrets

## Helm
## After downloading and installing helm add repo:

helm repo add goharbor https:// helm.goharbor.io
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add gitlab  https://charts.gitlab.io

### install Bazel

sudo apt install apt-transport-https curl gnupg
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
sudo mv bazel.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo teee /etc/apt/sources.list.d/bazel.list
sudo apt update && sudo apt install bazel

### Jupyter notebook install 

python3 -m pip install jupyterlab
python3 -m pip install fastapi ### this one is a probleatic one
