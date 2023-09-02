# Inception

Inception is a DevOps project that leverages Docker to create and link containers.

## Introduction

## Containerization
Containerization is a software deployment method that packages an application and its dependencies into a self-contained unit called a container. It isolates the application from the underlying infrastructure, making it portable and consistent across different environments.
<br>

### How does it work
Containerization works by bundling an application's code, along with its dependencies and configuration files, into a single executable called a container. Containers are isolated and encapsulated units that can run consistently on any infrastructure. Here's a breakdown of how containerization works:

Overall, containerization simplifies the deployment and management of applications by providing a consistent and isolated environment. It enables faster application delivery, improved scalability, and easier migration between different environments.


## Container engine
A container engine, also known as a container runtime, is a software program that creates and manages containers based on container images. It acts as an intermediary between the containers and the operating system, providing and managing the resources that the application needs to run. Here's a breakdown of container engines based on the search results:

**Container Engines and Runtimes:** Container engines are responsible for running multiple isolated instances, known as containers, on the same operating system kernel. They provide a controlled and easily manageable environment for running applications and their dependencies. Container engines use container runtimes to perform the containerization process and configure access and security policies for containers[0].

**Container Engines:** Container runtimes are software components that manage the lifecycle of containers, including configuring their environment, starting, stopping, and managing their execution.

---

   **Popular Container Engines: Some of the most widely used container engines include:**

- Docker: Docker is an open-source containerization technology that provides a complete ecosystem for building, packaging, and deploying containers. It includes Docker Engine, which acts as the container runtime, and Docker CLI, which allows users to interact with the Docker daemon[[2]](https://docs.docker.com/engine/).

- containerd: containerd is an open-source container runtime that focuses on simplicity, robustness, and portability. It is designed to be used as a building block for higher-level container orchestration platforms, such as Kubernetes[[1]](https://sarusso.github.io/blog/container-engines-runtimes-orchestrators.html).

- Many more ...

## Docker
Docker is a container-based model where containers are used to execute applications on any operating system.
Docker containers use the same operating system as the host, resulting in high performance and less boot-up time.
Docker containers are smaller than VMs, making it easier to transfer files and share data.
Docker containers start with no delay since the OS is already up and running.
Docker containers are designed to save time in the deployment process of an application.
Docker containers provide a more flexible and lightweight approach to application deployment.

### Docker engine
<img src="https://www.docker.com/wp-content/uploads/2021/10/Docker-Website-2018-Diagrams-071918-V5_a-Docker-Engine-page-first-panel.png" width="50%">

- Docker Engine is responsible for creating and managing Docker objects like images, containers, networks, and volumes.
- It consists of a server-side daemon process called dockerd, a REST API, and a client-side command-line interface (CLI) called docker.
- The Docker daemon (dockerd) hosts images, containers, networks, and storage volumes, while the CLI (docker) allows users to interact with the Docker daemon through the API.
- Docker Engine is declarative, meaning that administrators can program a specific set of conditions as the desired state, and the engine automatically adjusts the actual settings and conditions to match the desired state.
- Docker Engine can run natively on Linux systems and has been extended to operate on Windows and macOS as well.

In summary, Docker Engine is the core component of Docker that manages containers, images, networks, and volumes. It provides a client-server architecture with a daemon process (dockerd), a REST API, and a command-line interface (docker) for interacting with the Docker daemon.

**Dockerd**

- Dockerd is responsible for starting and managing the Docker daemon, which is the core component of Docker.
- It is a server or daemon process that runs in the background and listens for Docker API requests from the Docker client.
- Dockerd manages various Docker objects such as images, containers, networks, and volumes.
- It communicates with other daemons to manage Docker services.
- Dockerd can be started with different options and flags, such as --debug for running with debug output and --experimental for enabling experimental features.
- It can be configured using the daemon.json file, where you can specify options like debug mode and experimental features.

**Daemon**
Daemon is a program that runs continuously as a background process in a multitasking operating system. It is not directly controlled by the user and is usually initiated at system startup
- A daemon is a program that runs in the background and wakes up to handle periodic service requests, often from remote processes [source](https://www.techtarget.com/whatis/definition/daemon).

---

While Docker and VMs have their own advantages and use cases, they can also be used together. Docker containers can be run on virtual machines, combining the flexibility and lightweight nature of Docker with the security and isolation of VMs. This allows organizations to cover a range of use cases and make their virtual resources as flexible as possible.

<img src="https://f4n3x6c5.stackpathcdn.com/article/containerization-of-applications/Images/Containerization%20of%20Applications.png" width="50%">

# Docker in-depth
**Docker CLI cheat sheet**<br>
<img src="https://raw.githubusercontent.com/sangam14/dockercheatsheets/master/dockercheatsheet8.png" width="50%">
<img src="https://intellipaat.com/blog/wp-content/uploads/2022/10/Docker-Cheat-Sheet-2022.jpg" width="50%">

## Image
An image in Docker is a read-only template that contains the instructions for creating a Docker container. It is a snapshot of a Docker container that includes the application code, runtime, system tools, libraries, and settings. Images are used to create containers, and they can be shared and reused across different environments.

## Container
A container in Docker is a lightweight, standalone, and executable package of software that includes everything needed to run an application, including the code, runtime, system tools, libraries, and settings. Containers are isolated from each other and from the host system, which makes them portable and easy to deploy across different environments.

When you run a Docker container, it is created from an image. The container is an instance of the image, and it can be started, stopped, and deleted without affecting the image. You can create multiple containers from the same image, and each container will have its own isolated environment.

## Dockerfile

[*official documentation*](https://docs.docker.com/engine/reference/builder/)

A Dockerfile is a text document that contains a set of instructions for building a Docker image. It is used to automate the process of creating a Docker image with all the necessary dependencies and configurations. 
Each instruction in the Dockerfile is a command that is executed in sequence to build the image.

Here is an overview of the components of a Dockerfile:

- **FROM:** The FROM instruction specifies the base image for the Docker image. It defines the starting point for the image build process. Typically, you start with an existing image from a registry or another Dockerfile.

- **RUN:** The RUN instruction executes a command inside the Docker image during the build process. It is used to install packages, run scripts, or perform any other necessary setup tasks.

- **COPY/ADD:** The COPY and ADD instructions copy files and directories from the host machine into the Docker image. They are used to add application code, configuration files, or any other required files to the image.

- **WORKDIR:** The WORKDIR instruction sets the working directory for any subsequent instructions in the Dockerfile. It is used to specify the directory where commands will be run inside the image.

- **EXPOSE:** The EXPOSE instruction informs Docker that the container will listen on the specified network ports at runtime. It does not publish the ports to the host machine; it is just a documentation for the user.

- **CMD:** The CMD instruction specifies the command to run when a container based on the image is started. It provides the default command or process that should be executed inside the container.

These are some of the commonly used instructions in a Dockerfile. There are other instructions available as well, such as **ENV** for setting environment variables, **ENTRYPOINT** for configuring the container's main command, and VOLUME for creating a mount point for external volumes.

It's important to note that Dockerfiles are case-sensitive and should be named "Dockerfile" with no file extension. They should be placed in the same directory as the application code or configuration files they reference.

```Dockerfile
# Use the Alpine Linux base image
FROM alpine:3.18

# Set environment variables for MariaDB
ENV MYSQL_ROOT_PASSWORD=mysecretpassword
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Install MariaDB and other dependencies
RUN apk update && \
    apk add --no-cache mariadb mariadb-client && \
    rm -rf /var/cache/apk/*

# Copy the custom configuration file to the container
COPY my.cnf /etc/mysql/my.cnf

# Expose the default MariaDB port
EXPOSE 3306

# Start the MariaDB server
CMD ["mariadb"]

```

- You can build your image using this command:
```sh
 # -t Option to specify the image name.
 docker build -t img_name /path/to/dockerfile/
```
```sh
# --env-file to specify the .env file
docker build --env-file .env -t my_image /path/to/dockerfile/
```

---

# Docker Compose

Here's a sheet cheat:
[docker-compose sheet cheat](https://devhints.io/docker-compose)

## What is Docker Compose?

**Docker Compose** is a tool for defining and running multi-container Docker applications. It allows you to define your application's services, networks, and volumes in a single YAML file, making it easier to manage and deploy complex applications with multiple interconnected containers. Docker Compose is particularly useful for development, testing, and production scenarios where multiple containers need to work together.

## Uses of Docker Compose

Docker Compose simplifies the following tasks:

1. **Multi-Container Applications**: Easily define and manage applications composed of multiple containers that need to work together, such as web applications with databases, caching, and messaging services.

2. **Service Definitions**: Specify the configuration for each service, including the base image, environment variables, ports, volumes, and more, all in a human-readable YAML format.

3. **Networking**: Automatically create and manage isolated networks for your containers, allowing them to communicate securely with each other. You can also specify custom network configurations.

4. **Volume Management**: Define named volumes for persisting data between container restarts and even between different containers. This is essential for databases and stateful applications.

5. **Environment Configuration**: Set environment variables for containers, enabling you to customize container behavior without changing the container image.

## Common Docker Compose Commands

Here are some common Docker Compose commands and their explanations:

### `docker-compose up`

- **Description**: Start containers defined in the `docker-compose.yml` file.
- **Usage**: `docker-compose up [options] [SERVICE...]`
- **Options**:
  - `-d, --detach`: Run containers in the background.
- **Example**: `docker-compose up -d` starts containers in detached mode.

### `docker-compose down`

- **Description**: Stop and remove containers, networks, and volumes defined in the `docker-compose.yml` file.
- **Usage**: `docker-compose down [options]`
- **Options**:
  - `--volumes`: Remove named volumes as well.
- **Example**: `docker-compose down --volumes` stops and removes containers and associated volumes.

### `docker-compose ps`

- **Description**: List the status of containers in the current Docker Compose project.
- **Usage**: `docker-compose ps`
- **Example**: `docker-compose ps` displays the status of containers.

### `docker-compose logs`

- **Description**: View output logs from containers.
- **Usage**: `docker-compose logs [options] [SERVICE...]`
- **Options**:
  - `-f, --follow`: Follow log output in real-time.
- **Example**: `docker-compose logs -f` displays logs and follows new entries.

### `docker-compose exec`

- **Description**: Run a command in a running container.
- **Usage**: `docker-compose exec [options] SERVICE COMMAND [ARGS...]`
- **Example**: `docker-compose exec webserver sh` starts a shell session in the `webserver` container.

### `docker-compose build`

- **Description**: Build or rebuild services defined in the `docker-compose.yml` file.
- **Usage**: `docker-compose build [options] [SERVICE...]`
- **Options**:
  - `--no-cache`: Do not use cached images.
- **Example**: `docker-compose build` builds all services.

### `docker-compose up`

- **Description**: Start containers defined in the `docker-compose.yml` file.
- **Usage**: `docker-compose up [options] [SERVICE...]`
- **Options**:
  - `-d, --detach`: Run containers in the background.
- **Example**: `docker-compose up -d` starts containers in detached mode.

These are just a few of the many commands and options available in Docker Compose. It's a powerful tool for simplifying the management of multi-container applications and improving the development and deployment process.