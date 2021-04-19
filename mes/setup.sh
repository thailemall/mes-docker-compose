#!/bin/bash

docker stop mes
docker rm mes
docker rmi thailemall/mes:latest
docker network create mes-network
docker-compose up
