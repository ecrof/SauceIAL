
# DEPLOYMENT ON OVH KUBERNETES :
 !!! Do not forget to clean up everything at the end, it could cost money $ !!!

1. Configuration of a Kubernetes Cluster in the OVH Public Cloud. Add a pool of nodes.
2. Install kubectl locally, to access informations of the Kubernetes service.
3. Connexion to the server thanks to the kubeconfig.yml file to download.
```
export KUBECONFIG=./deployment/OVH/kubeconfig.yml
kubectl cluster-info
```
[Install the dashboard](https://docs.ovh.com/gb/en/kubernetes/installing-kubernetes-dashboard/) if monitoring is needed.
## Dashboard
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.1/aio/deploy/recommended.yaml
kubectl apply -f ${SCRIPT_DIR}/OVH/Dashboard/dashboard-service-account.yml
kubectl apply -f ${SCRIPT_DIR}/OVH/Dashboard/dashboard-cluster-role-binding.yml
kubectl apply -f ${SCRIPT_DIR}/OVH/Dashboard/service-account-token.yml
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user-token | awk '{print $1}')
kubectl proxy
```
http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
If error: Try to clear cookies of your browser

4. Apply the deployment on the OVH kubernetes cluster with:
```
kubectl apply -f kubernetes-ovh-deployment.yml
```
https://support.us.ovhcloud.com/hc/en-us/articles/1500004901802
https://support.us.ovhcloud.com/hc/en-us/articles/1500005029142-How-to-Set-Up-a-Persistent-Volume-on-OVHcloud-Managed-Kubernetes

5. Do not forget to remove the pool of nodes and the loadbalancer.
```
kubectl get all
```
```
kubectl delete deployment.apps/fastapi-deployment
kubectl delete service/flask-service
```
---------------------------
[Creating a cluster through Terraform:](https://docs.ovh.com/sg/en/kubernetes/creating-a-cluster-through-terraform/#before-you-begin)

[Installing Terraform CLI](https://www.terraform.io/downloads)
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
```
Run these commands carefully:
```
terraform init
terraform plan
terraform apply
```