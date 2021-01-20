#!/bin/bash

docker stop auth
docker rm auth
docker rmi thailemall/jinnalee-auth:latest
docker network create account-network
docker-compose up
