
## Run it locally
### Install virtual environment
```$ python3 -m venv venv/ ```

### Active the venv
```$ source ./venv/bin/activate ```

```$ pip3 install -r app/requirements.txt ```

### install docker
### Build the docker image
```$ docker build -t myimagename ./app/ ```

### Run the docker image
```$ docker run -d --name mycontainername -p 80:80 myimagename ```

### If needed to clean services
```$ sudo lsof -i -P -n | grep 80 ```

```$ sudo service nginx stop ```

### Access it
In a browser: http://127.0.0.1/

## Put the docker image in an online repertory (dockerhub)
```$ docker login```

```$ docker tag myimagename ecrof/myrepertoryname:mytagname```

```$ docker push ecrof/myrepertoryname:mytagname```

## Run it locally with minikube
### install Kubernetes CLI (kubectl) together with Minikube (https://kubernetes.io/docs/tasks/tools/)
### start minikube
```$ minikube start```
### deploy the app
```$ kubectl apply -f deployment/Minikube/kubernetes-minikube-deployment.yml```
### monitor it
```$ minikube dashboard```

(```$ kubectl delete clusterrolebinding kubernetes-dashboard```)
### access it
if the external IP is pending: ```$ minikube tunnel```

```$ kubectl get service```

## Put it on OVH
```$ kubectl apply -f kubernetes-ovh-deployment.yml```


# To Deploy the Application locally with Docker-Compose:
If needed, do not forget to make the bash script executable with 
```
sudo chmod +x <SCRIPTBASH>
```
Then run the script:
```
./LocalDeployment.sh
```
Undeploy with:
```
./LocalUndeployment.sh
```
# DEPLOYMENT ON MiniKube :
Install Minikube:
```
sudo apt install virtualbox
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

Install Kubectl:
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

Run the deployment script :
```
./MinikubeDeployment.sh
```
Check the Dashboard:
```
minikube dashboard 
```
# DEPLOYMENT ON OVH KUBERNETES :
 !!! Do not forget to clean up everything at the end !!!



# Developpement 


## Structure of the repository/Organization

### Source Code

This process is composed several submodules that can be exectued independently. All the modules are located in the 'src' folder and they all have README to detail their implementation. Here we will briefly describe each module. If you intend to work on a submodule please complete also the corresponding README:

1. **Database creation**: This module contain all the necessary information to connect to the DB or to recreate the DB locally.
2. **Back-end creation**: This module contain all the necessary information to run the back-end application.
3. **Front-end creation**: This module contain all the necessary information to run the front-end application.
4. **Front-end data-acquisition**: This module contain all the necessary information to run the first front-end for data acquisition.

5. **OLD (useless but to keep for now):**
    * app (no longer used): contains all about the old app
        * OVH-flask : a first deployment of a flask app on OVH kubernetes
        * Stripe-Payment : a first usage of Stripe for payments
        * static: display settings
        * template: html pages
        * translations: multiple languages management
        * .py files: python scripts that runs the app

    * ML: Sandbox that contains drafts of ML models/algo.


## TODO
* change login with global variable with flask login and session (https://flask-login.readthedocs.io/en/latest/)
* add Stripe Payment
