sudo  docker stop mes
sudo  docker stop gateway
sudo  docker stop discovery
sudo  docker rm mes
sudo  docker rm gateway
sudo  docker rm discovery
sudo  docker rmi thailemall/mes:latest
sudo  docker rmi thailemall/gateway:latest
sudo  docker rmi thailemall/discovery:latest
sudo  docker network create mes-network
sudo  docker-compose up
