#!/bin/bash
docker stop discovery
docker rm discovery
docker rmi thailemall/discovery:latest
docker network create mes-network
docker-compose up
