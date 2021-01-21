#!/bin/bash

docker stop mes
docker stop gateway
docker stop discovery
docker stop auth
docker rm mes
docker rm gateway
docker rm discovery
docker rm auth
docker rmi thailemall/mes:latest
docker rmi thailemall/gateway:latest
docker rmi thailemall/discovery:latest
docker rmi thailemall/jinnalee-mes:latest
docker network create mes-network
docker-compose up
