#!/bin/bash

docker stop rabbit
docker rm rabbit
docker network create mes-network
docker-compose up
