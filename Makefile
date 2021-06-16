DOCKER_COMPOSE		= docker-compose --project-directory srcs \
						-f srcs/docker-compose.yml


TABS				= \t\t\t\t
NEW_LINE			= \n
LIGHT_PURPLE		= \033[1;35m
NC					= \033[0m

# Build the inception with docker-compose
build	:
		  @$(DOCKER_COMPOSE) build 

# Starts services containers
up		:
		  @echo "$(TABS)$(LIGHT_PURPLE)BUILD & START CONTAINERS$(NC)$(NEW_LINE)"
		  @$(DOCKER_COMPOSE) up -d

# Remove services
down	:
		  @echo "$(TABS)$(LIGHT_PURPLE)STOP & DELETE CONTAINERS$(NC)$(NEW_LINE)"
		  @$(DOCKER_COMPOSE) down

# Show services
ps		:
		  @$(DOCKER_COMPOSE) ps

# Remove docker images
iclean	:
		  @echo "$(TABS)$(LIGHT_PURPLE)DELETE IMAGES$(NC)$(NEW_LINE)"
		  @-docker rmi -f debian:buster
		  @-docker rmi -f nginx:inception
		  @-docker rmi -f wordpress:inception
		  @-docker rmi -f mariadb:inception

# Remove volumes
vclean	:
		  @echo "$(TABS)$(LIGHT_PURPLE)DELETE VOLUMES$(NC)$(NEW_LINE)"
		  @-docker volume rm wordpress
		  @-docker volume rm mariadb

# Remove network
nclean	:
		  @echo "$(TABS)$(LIGHT_PURPLE)DELELTE NETWORK$(NC)$(NEW_LINE)"
		  @-docker network rm inception


# Remove wordpress data
f_wp_clean:
		  @echo "$(TABS)$(LIGHT_PURPLE)DELETE WORDPRESS FILES$(NC)$(NEW_LINE)"
		  @rm -rf /home/pmarash/data/wp/*

# Remove database data
f_db_clean:
		  @echo "$(TABS)$(LIGHT_PURPLE)DELETE DATABASE FILES$(NC)$(NEW_LINE)"
		  @rm -rf /home/pmarash/data/db/*

f_clean	: f_db_clean f_wp_clean

volumes	: volume_db volume_wp

clean	: nclean iclean vclean

re		: clean up