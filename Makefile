NGINX = nginx
DOCKER_COMPOSE		= docker-compose --project-directory srcs \
						-f srcs/docker-compose.yml

build	: ## Build the project with docker-compose
		  $(DOCKER_COMPOSE) build 

up		: ## Starts services containers
		  $(DOCKER_COMPOSE) up -d

down	: ## Remove services
		  $(DOCKER_COMPOSE) down

iclean	: ## Remove docker images
		  -docker rmi -f nginx:inception
kill:
	cd ./srcs/; \
	docker-compose stop \

clear:
	docker rm ${NGINX}

fclean:
	docker rmi ${NGINX}

re: fclean set