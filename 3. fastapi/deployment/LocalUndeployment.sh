#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

### To undeploy locally the application
# Arrêter les containers et les networks SANS les supprimer via "ctrl+c".
# Stop and remove the containers:
docker-compose -f ${SCRIPT_DIR}/Local/docker-compose.yml down

# kill all containers (for port problem):
# $ docker kill $(docker ps -q)