#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <owner_name>"
  exit 1
fi

owner_name="$1"

# Create the main directory and set permissions
mkdir -p srcs/requirements/{bonus,mariadb,nginx,tools,wordpress}
chmod 775 srcs/requirements/{bonus,mariadb,nginx,tools,wordpress}
chown "$owner_name":"$owner_name" srcs/requirements/{bonus,mariadb,nginx,tools,wordpress}

# Create files and directories within the structure
touch Makefile srcs/docker-compose.yml srcs/.env
chmod 664 Makefile srcs/docker-compose.yml srcs/.env
chown "$owner_name":"$owner_name" Makefile srcs/docker-compose.yml srcs/.env

# Create files and directories in mariadb, nginx, and other subdirectories
for dir in srcs/requirements/mariadb srcs/requirements/nginx srcs/requirements/tools
do
    mkdir -p "$dir/conf"
    touch "$dir/Dockerfile" "$dir/.dockerignore"
    chmod 664 "$dir/Dockerfile" "$dir/.dockerignore"
    chown "$owner_name":"$owner_name" "$dir/Dockerfile" "$dir/.dockerignore"
done

# Add content to srcs/.env
echo "DOMAIN_NAME=$owner_name.42.fr" > srcs/.env
echo "# certificates" >> srcs/.env
echo "CERTS_=./XXXXXXXXXXXX" >> srcs/.env
echo "# MYSQL SETUP" >> srcs/.env
echo "MYSQL_ROOT_PASSWORD=XXXXXXXXXXXX" >> srcs/.env
echo "MYSQL_USER=XXXXXXXXXXXX" >> srcs/.env
echo "MYSQL_PASSWORD=XXXXXXXXXXXX" >> srcs/.env

# Set permissions for srcs/.env
chmod 664 srcs/.env
chown "$owner_name":"$owner_name" srcs/.env

echo "Directory structure and files created successfully!"
