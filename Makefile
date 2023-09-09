PROJECT_NAME = inception

DIR = srcs

UP = docker-compose -p $(PROJECT_NAME) -f $(DIR)/docker-compose.yml up -d --build

DOWN = docker-compose -p $(PROJECT_NAME) -f $(DIR)/docker-compose.yml down

FULL_CLEAN = docker-compose -p $(PROJECT_NAME) -f $(DIR)/docker-compose.yml down -v --remove-orphans

all: run

run:
	sh srcs/requirements/tools/init_db.sh
	$(UP)

clean:
	$(DOWN)

fclean: clean
	sudo rm -rf /home/$(USER)/data
	sudo rm -rf /Users/$(USER)/data
	docker builder prune -a
	$(FULL_CLEAN)

.PHONY: all run clean fclean
