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

<img src="https://www.docker.com/wp-content/uploads/2021/10/Docker-Website-2018-Diagrams-071918-V5_a-Docker-Engine-page-first-panel.png">

## Docker
Docker is a container-based model where containers are used to execute applications on any operating system.
Docker containers use the same operating system as the host, resulting in high performance and less boot-up time.
Docker containers are smaller than VMs, making it easier to transfer files and share data.
Docker containers start with no delay since the OS is already up and running.
Docker containers are designed to save time in the deployment process of an application.
Docker containers provide a more flexible and lightweight approach to application deployment.

## Virtual Machines
VMs are a virtualized copy of a physical machine and can have their own individual operating systems.
VMs use a separate OS for each instance, resulting in more resource usage and slower startup times.
VMs require a full boot process to deploy a single application.
VMs can provide better security and isolation since they run on their own OS without being a threat to the host computer.
VMs are suitable for applications that are static and don't change frequently.

    While Docker and VMs have their own advantages and use cases, they can also be used together. Docker containers can be run on virtual machines, combining the flexibility and lightweight nature of Docker with the security and isolation of VMs. This allows organizations to cover a range of use cases and make their virtual resources as flexible as possible.

<img src="https://f4n3x6c5.stackpathcdn.com/article/containerization-of-applications/Images/Containerization%20of%20Applications.png">