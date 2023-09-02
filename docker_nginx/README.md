# docker_compose_config_NGINX_HTML
My training simple config with docker compose

Your need docker and docker-compose in your operation system.

CLONE:
git clone https://github.com/codesshaman/simple_docker_nginx_html.git

GO TO FOLDER:
cd simple_docker_nginx_html

Every commands executed into the folder with docker-compose.yml file.

BUILD (first start):
docker-compose up -d --build

RUN:
docker-compose up -d

STOP:
docker-compose down

CONNECT:
docker exec -it nginx_simple sh

OPEN:
http://localhost/
