# mes-docker-compose
##  docker/rabbitmq.conf

    loopback_users.guest = false
    listeners.tcp.default = 5672
    management.listener.port = 15672
    management.listener.ssl = false

    auth_backends.1 = http

    ## This configures rabbitmq_auth_backend_cache that delegates to
    ## the HTTP backend. If using this, make sure to comment the
    ## auth_backends.1 line above.
    ##
    # auth_backends.1 = cache
    #
    # auth_cache.cached_backend = http
    # auth_cache.cache_ttl = 5000


    auth_http.http_method   = get
    auth_http.user_path     = http://192.168.1.15:8080/auth/user
    auth_http.vhost_path    = http://192.168.1.15:8080/auth/vhost
    auth_http.resource_path = http://192.168.1.15:8080/auth/resource
    auth_http.topic_path    = http://192.168.1.15:8080/auth/topic
##  docker/enabled_plugins   
    [rabbitmq_management,rabbitmq_auth_backend_cache,rabbitmq_auth_backend_http,rabbitmq_mqtt].
##  docker-compose.yml
    version: "3"
      services:
        rabbit:
          image: rabbitmq:management
          volumes: 
            - ./docker/rabbitmq.conf:/etc/rabbitmq/rabbitmq.conf
            - ./docker/enabled_plugins:/etc/rabbitmq/enabled_plugins
          ports:
            - 15672:15672
            - 1883:1883
       discovery:
         image: thailemall/discovery
         container_name: discovery
         ports:
           - "8761:8761"
       mes:
         image: thailemall/mes
         container_name: mes
         ports:
           - "8081:8081"
         environment:
           EUREKA_DEFAULT_ZONE: http://discovery:8761/eureka
         links:
           - discovery
       gateway:
         image: thailemall/gateway
         container_name: gateway
         ports:
           - "80:80"
        environment:
          EUREKA_DEFAULT_ZONE: http://discovery:8761/eureka
          HOST_NAME: http://192.168.1.248:80
        links:
          - discovery
          - mes
    networks:
      default:
        external:
          name: mes-network
## setup
  
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
