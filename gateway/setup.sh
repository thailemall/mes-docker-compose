#!/bin/bash
docker stop gateway
docker rm gateway
docker rmi thailemall/gateway:latest
docker network create mes-network
docker-compose up
