# Colors
RESET   = \033[0m
CYAN    = \033[1;36m

# Variables
NAME = inception
SRCS = ./srcs/
COMPOSE = ./srcs/docker-compose.yml
ENVFILE = ../.env

# Commands
all:	conf up

conf:
	@echo "$(CYAN)Copying envfile to ./srcs/$(RESET)"
	cp $(ENVFILE) $(SRCS)
	@echo "$(CYAN)Creating volumes...$(RESET)"
	mkdir -p /home/pealexan/data/mariadb /home/pealexan/data/wordpress
	@echo "$(CYAN)Changing localhost to pealexan.42.fr...$(RESET)"
	sudo sed -i '/^127.0.0.1/ {/pealexan.42.fr/! s/localhost/localhost pealexan.42.fr/}' /etc/hosts

up:	
	docker compose -p $(NAME) -f $(COMPOSE) up --build -d
	@echo "$(CYAN)Finishing set up...$(RESET)"
	@sleep 10
	@echo "$(CYAN)Done!(RESET)"

down:
	docker compose -p $(NAME) down --volumes

start:
	docker compose -p $(NAME) start

stop:
	docker compose -p $(NAME) stop

clean-images:
	docker rmi -f $$(docker images -q) || true	

clean: down clean-images

fclean: clean
	@sudo rm -rf /home/pealexan/data
	@sudo docker system prune
	@sudo rm ./srcs/.env

re: fclean conf up

