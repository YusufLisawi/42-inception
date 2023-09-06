# Define the name of the Docker Compose project
PROJECT_NAME = inception

# Define the Docker Compose file name
DIR = srcs

# Define the Docker Compose command to run the containers
UP = docker-compose -p $(PROJECT_NAME) -f $(DIR)/docker-compose.yml up# -d

# Define the Docker Compose command to stop and remove the containers
DOWN = docker-compose -p $(PROJECT_NAME) -f $(DIR)/docker-compose.yml down

# Define the Docker Compose command to stop and remove the containers, as well as any volumes and networks
FULL_CLEAN = docker-compose -p $(PROJECT_NAME) -f $(DIR)/docker-compose.yml down -v --remove-orphans

# Define the default target
all: run

# Define the target to run the containers
run:
	$(UP)

# Define the target to stop and remove the containers
clean:
	$(DOWN)

# Define the target to stop and remove the containers, as well as any volumes and networks
fclean:
	$(FULL_CLEAN)

.PHONY: all run clean fclean