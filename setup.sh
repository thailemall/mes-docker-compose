docker stop mes
docker stop gateway
docker stop discovery
docker rm mes
docker rm gateway
docker rm discovery
docker rmi thailemall/mes:latest
docker rmi thailemall/gateway:latest
docker rmi thailemall/discovery:latest
docker network create mes-network
docker-compose up
