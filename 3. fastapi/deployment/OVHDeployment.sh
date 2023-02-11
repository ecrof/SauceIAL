#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/Minikube/config.txt

# kubectl config
# export KUBECONFIG=./deployment/OVH/kubeconfig.yml
export KUBECONFIG=${SCRIPT_DIR}/OVH/kubeconfig.yml

# Secret
kubectl delete secret myregistrykey
kubectl create secret docker-registry myregistrykey --docker-server=$dockerregistryserver --docker-username=$dockerusername --docker-password=$dockerpassword --docker-email=$dockeremail

# Application
kubectl apply -f ${SCRIPT_DIR}/OVH/kubernetes-ovh-deployment.yml

