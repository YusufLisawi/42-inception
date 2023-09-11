NAME = inception

CREATE_DIRS = sh srcs/requirements/tools/init_db.sh

all:
	@echo "Building images..."
	$(CREATE_DIRS)
	@docker-compose -p $(NAME) -f srcs/docker-compose.yml up -d

clean:
	@echo "Removing containers..."
	docker-compose -p $(NAME) -f srcs/docker-compose.yml down

fclean: clean
	@echo "Full cleaning..."
	@sudo rm -rf /home/$(USER)/data
	@docker builder prune -a -f
	docker-compose -p $(NAME) -f srcs/docker-compose.yml down -v --remove-orphans

re: fclean all

.PHONY: build all re clean fclean
