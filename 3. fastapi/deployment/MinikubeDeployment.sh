#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/Minikube/config.txt

### DEPLOYMENT ON MiniKube :
# Do not forget to clean up everything at the end ($ minikube delete --all)

# Install and start minikube (kubernetes cluster en local for testing)
sudo chmod 666 /var/run/docker.sock

echo 'Starting minikube'
minikube start
# If necessary, upload new images of docker containers
#./UploadAllDockerImages.sh
#sleep 15
#minikube dashboard 
# minikube tunnel --cleanup &
# alias k="minikube kubectl --"

# Create the docker container repository secret :
kubectl delete secret myregistrykey
kubectl create secret docker-registry myregistrykey --docker-server=$dockerregistryserver --docker-username=$dockerusername --docker-password=$dockerpassword --docker-email=$dockeremail
# Be sure that you configure with the good tipo the imagePullSecrets: "imagePullSecrets: - name: myregistrykey" in the yaml file.

# Upload the latest container images:
# echo 'Upload the latest container images'
# ./UploadAllDockerImages.sh

# Create a kubernetes deployment:
# kubectl apply -f ${SCRIPT_DIR}/Minikube/KubernetesMinikube-deployment.yml
kubectl apply -f ${SCRIPT_DIR}/Minikube/kubernetes-minikube-deployment.yml

# Access it with a service by check external IP.
# kubectl get service

# Try in your browser: 
# * open in your browser (make sure there is no proxy set)
# * http://REPLACE_WITH_EXTERNAL_IP:8080

# Or using minikube service:
# minikube service ucoachme-loadbalancer

# Dashboard
# minikube dashboard

# To Debug
#kubectl get pod
#kubectl describe pod backendapi-deployment-cf9ccc486-s6cst
# Check the exit code
# get the logs: https://www.sumologic.com/blog/kubectl-logs/
# kubectl logs backendapi-deployment-cf9ccc486-jpm87
# possible soslutions:
# https://minikube.sigs.k8s.io/docs/handbook/accessing/
# https://stackoverflow.com/questions/40767164/expose-port-in-minikube
# https://minikube.sigs.k8s.io/docs/handbook/host-access/
# https://minikube.sigs.k8s.io/docs/faq/
# https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
# https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/

