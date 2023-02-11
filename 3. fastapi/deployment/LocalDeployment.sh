#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

### To Deploy the Application locally with Docker-Compose:

## [Install Docker Engine](https://docs.docker.com/engine/install/)
# Do not forget to open a terminal and type this command to give permissions to docker:
sudo chmod 666 /var/run/docker.sock

# If a port is already bound (you can see it with this command)
# $ sudo ss -lptn 'sport = :5432'
# You can free it with this command:
sudo fuser -k 5432/tcp

## [Install Docker-Compose](https://docs.docker.com/compose/install/)
# Run Docker Compose (-d: in detached mode) from this directory:
docker-compose -f ${SCRIPT_DIR}/Local/docker-compose.yml up -d --build

## Usage, or connexion with the front-end tool
# To take advantage of the UCoachMe tool interface, go to a browser and listen to the port 5000 of the localhost address : "http://127.0.0.1:5000"
# (You could also use "localhost" or "0.0.0.0")
sleep 3
xdg-open http://127.0.0.1:80

## Connexion with the API Index
# * On a browser, enter : "http://localhost:8080/"

## Connexion with the postgres database with PGAdmin 4
# * On a browser, enter : "http://localhost:5050/"
# * EMAIL=pgadmin4@pgadmin.org
# * PASSWORD=admin
# Get the IP of the database
# Know the id of the database postgresql container:
# $ docker ps
# Get the IP Address of this container:
# $ docker inspect 2f50fabe8a87 | grep IPAddress
# or
# $ docker ps -q | xargs -n 1 docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} {{ .Name }}' | sed 's/ \// /'
# enter the information for create a server:
# * General/Name = databaseucoachme
# * Connection/hostname = 'IPAddress'
# * Connection/user = admin
# * Connection/password = adminpassword

# You are connected to the DB
# You can now, for example, enter a query:
# "SELECT * FROM ucoachme.category;"