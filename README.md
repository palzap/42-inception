## Project Overview: Inception

### Introduction

The **Inception** project aims to broaden your knowledge of system administration through the practical application of Docker and Docker Compose. By setting up a small infrastructure composed of various interconnected services, this project provides hands-on experience in virtualizing services, configuring containers, and managing orchestration with Docker Compose. The emphasis on shell scripting for configuration enhances automation and ease of deployment.

---

### Key Features

1. **Docker and Docker Compose**
   - **Containerization**: Docker is used to create isolated environments for each service. This encapsulation ensures consistent behavior across different environments, reduces conflicts, and simplifies dependency management.
   - **Orchestration**: Docker Compose orchestrates the deployment of multiple containers, managing their configuration, network, and volume dependencies. This orchestration provides a unified and automated way to manage service lifecycles.

2. **Service Architecture**
   - **NGINX with TLS**: A Docker container running NGINX configured with TLSv1.2 or TLSv1.3 serves as the secure entry point for the infrastructure, handling HTTPS traffic and ensuring encrypted communication.
   - **WordPress + php-fpm**: A separate container runs WordPress alongside `php-fpm`, handling PHP execution without including NGINX. This separation of concerns follows best practices for scalable and maintainable web applications.
   - **MariaDB**: A dedicated container for MariaDB manages the WordPress database, isolated from the web server to enhance security and performance.
   - **Volumes and Networking**: Persistent volumes are used to store WordPress files and database data, ensuring data continuity across container restarts. A custom Docker network enables communication between the containers, segregating internal traffic from external access.

3. **Shell Scripting for Configuration**
   - **Automated Setup**: Shell scripts automate the setup process, configuring each service according to predefined parameters. These scripts ensure consistency in setup and reduce manual intervention, aligning with infrastructure-as-code principles.
   - **Environment Variables**: Scripts use environment variables to manage sensitive information and configuration parameters, enhancing security and flexibility. This approach allows easy updates and changes to the configuration without modifying the core scripts.

4. **Security and Best Practices**
   - **Secure Configuration**: Best practices such as not hardcoding passwords, using environment variables, and securing TLS settings are followed to ensure a robust and secure infrastructure.
   - **Container Restart Policies**: Containers are configured to restart on failure, enhancing resilience and availability. This configuration is critical for maintaining service continuity in production environments.

5. **Development and Deployment**
   - **Makefile Integration**: A Makefile at the root of the directory integrates with Docker Compose to build and deploy the Docker images, streamlining the build process and ensuring a repeatable deployment workflow.
   - **Domain Configuration**: Custom domain names configured to point to the local IP address facilitate easy access to the services. This setup includes configuring local DNS entries to map the domain to the infrastructure's entry point.

---

### Implementation Details

- **Docker Images**: Each service has its own Dockerfile to build a tailored image, reflecting specific configurations and dependencies. This approach allows granular control over the service environments and avoids using pre-built images.
- **Docker Compose**: The `docker-compose.yml` file defines the services, networks, and volumes, orchestrating their relationships and dependencies. This configuration file is central to managing the entire setup through a single command interface.
- **Shell Scripts**: Scripts automate the container setup, including service configurations, environment variable injection, and initial setup tasks. These scripts improve reproducibility and reduce manual setup errors.

---

### Service Configuration and Connectivity

- **NGINX**: Configured with TLS, NGINX serves as the front-facing server, handling HTTPS traffic and forwarding requests to the appropriate backend services.
- **WordPress**: Running within a container, WordPress connects to the MariaDB container for database interactions, facilitated by the custom Docker network.
- **MariaDB**: This database service stores WordPress data in a persistent volume, providing reliable data storage and retrieval.

---

### Conclusion

The **Inception** project provides a comprehensive exercise in using Docker and Docker Compose for system administration tasks. By setting up a small-scale infrastructure, it highlights the practical applications of containerization, orchestration, and automated configuration through shell scripting, offering valuable insights into modern infrastructure management practices.

---
### Evaluation
#### First submission
08/05/2024  
100%
