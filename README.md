# Finch Technical Exercise - DevOps Engineer

## Context
A Bank is planning to launch a new web application, and you need to set up a scalable, secure, and automated infrastructure in AWS. Your task is to design, implement, and demonstrate an architecture that supports the application in a production environment.

## Exercise Objectives
1. Deploy a high-availability architecture for a container-based web application.
2. Implement automation and CI/CD for the application deployment.
3. Ensure monitoring and logging of the infrastructure and application.
4. Ensure that the environment follows AWS best practices.

---

## Exercise Requirements

### Part 1: Automated Deployment and CI/CD
- Set up a CI/CD pipeline using any tool or combination of tools to:
  - Automatically deploy the web application to a container orchestration platform whenever there are code changes.
  - Integrate automated tests to verify the functionality of the application before deploying to production.
  - Use an automated build system to package and create container images from the source code.

### Part 2: Security
- Configure user roles, policies, and credentials to follow security best practices:
  - Create least-privilege access policies for infrastructure resources, users, and services.
  - Use a secure system to manage sensitive information such as passwords, API keys, and certificates.
  - Secure internal communication between services through network segmentation, firewalls, or other methods.
  - Implement HTTPS for secure web traffic and manage SSL certificates accordingly.

### Part 3: Monitoring and Logging
- Implement a monitoring and logging solution:
  - Collect performance metrics from your compute instances, container platform, and database.
  - Set up auditing to track changes to the infrastructure and system events.
  - Ensure that application and system logs are centralized for analysis and troubleshooting, with a solution for log aggregation and visualization.

### Part 4: Scalability and High Availability
- Ensure that the infrastructure can scale based on demand:
  - Configure automatic scaling for compute resources based on defined metrics like CPU, memory, or network usage.
  - Implement scaling policies in the container orchestration platform to adjust the number of application instances based on traffic load.
  - Ensure that the database is set up for high availability and can fail over to a secondary instance in case of an outage.

### Part 5: Infrastructure as Code (IaC)
Use **Terraform** or **AWS CloudFormation** to deploy the following infrastructure:
  - A highly available and redundant network architecture that spans multiple data centers to ensure fault tolerance and resilience.
  - A compute group that can automatically adjust its size based on load, with traffic distributed via a load balancing system.
  - A container-based platform to run the application, with support for scaling.
  - A managed database service in a private network segment for security and high availability.
  - Object storage for static files or backups.

---

## Deliverables

1. **Git Repository**:
   - Code for the infrastructure and CI/CD pipeline configuration.
   - Instructions to deploy the infrastructure and application.

2. **Documentation**:
   - Explanation of the architecture and technical decisions made.
   - Instructions on how to access and analyze logs, metrics, and monitoring.
   - Details on how security practices are applied in the environment.

3. **Live Demo**:
   - Presentation of the infrastructure and deployment.
   - Demonstration of the system’s ability to handle scalability and failover.
   - Show the CI/CD pipeline in action.

---

## Evaluation Criteria
1. **Automation**: How automated the deployment and CI/CD process is.
2. **Infrastructure**: Correct configuration and best practices for ensuring high availability and scalability.
3. **Security**: Implementation of security best practices for roles, policies, and network configuration.
4. **Monitoring**: Proper configuration of monitoring and logging solutions.
5. **Presentation**: Quality and clarity of documentation and live demo.
