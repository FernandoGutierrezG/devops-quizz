
# Finch Technical Exercise - DevOps Engineer

## Context:
A Bank is planning to launch a new web application, and you need to set up a scalable, secure, and automated infrastructure in AWS. Your task is to design, implement, and demonstrate an architecture that supports the application in a production environment.

## Exercise Objectives:
1. Deploy a high-availability architecture for a container-based web application.
2. Implement automation and CI/CD for the application deployment.
3. Ensure monitoring and logging of the infrastructure and application.
4. Ensure that the environment follows AWS security best practices.

---

## Exercise Requirements:

### Part 1: Automated Deployment and CI/CD
- Set up a CI/CD pipeline using **AWS CodePipeline**, **Jenkins**, or **GitLab CI** to:
  - Automatically deploy the web application to **ECS/EKS** whenever there are code changes.
  - Integrate automated tests to verify the functionality of the application before deploying to production.
  - Use **AWS CodeBuild** or **Docker** to build container images from the source code.

### Part 2: Security
- Configure **AWS IAM** to follow security best practices:
  - Create least-privilege policies for instances, users, and AWS services.
  - Use **AWS Secrets Manager** or **SSM Parameter Store** to securely manage passwords and API keys.
  - Secure internal communication between services with **Security Groups** and **NACLs**.
  - Implement **HTTPS** on the load balancer (ALB or ELB) using **ACM (AWS Certificate Manager)** for SSL certificates.

### Part 3: Monitoring and Logging
- Implement monitoring and logging solutions:
  - Set up **CloudWatch** to collect performance metrics from EC2 instances, ECS/EKS, and RDS.
  - Use **CloudTrail** to audit infrastructure changes and track AWS events.
  - Send application and system logs to **CloudWatch Logs** or use **ELK (Elasticsearch, Logstash, Kibana)** or **AWS OpenSearch** for log aggregation and visualization.

### Part 4: Scalability and High Availability
- Ensure that the infrastructure can scale automatically:
  - Configure **Auto Scaling** for EC2 instances based on metrics like CPU or memory usage.
  - Implement scaling policies in ECS/EKS to increase or decrease the number of instances based on traffic load.
  - Verify that RDS is set up in Multi-AZ mode to ensure high availability.

### Part 5: Infrastructure as Code (IaC)
- Use **Terraform** or **AWS CloudFormation** to deploy the following infrastructure:
  - **VPC** with at least two public and private subnets in different availability zones.
  - An **Auto Scaling** group for EC2 with load balancing using **Elastic Load Balancer (ELB)** or **Application Load Balancer (ALB)**.
  - **ECS (Elastic Container Service)** or **EKS (Elastic Kubernetes Service)** for container orchestration.
  - An **RDS (Relational Database Service)** using MySQL or PostgreSQL in a private subnet.
  - **S3** for static file storage or backups.
 
---

## Deliverables:

1. **Git Repository**:
   - IaC code (Terraform or CloudFormation).
   - Configuration files for the CI/CD pipeline.
   - Instructions to deploy the infrastructure and application.

2. **Documentation**:
   - Description of the designed architecture and technical decisions.
   - Instructions on how to access logs, metrics, and monitoring.
   - Details about the security practices implemented.

3. **Live Demo**:
   - Explanation of the infrastructure and deployment.
   - Tests for scalability and failover.
   - Show the CI/CD pipeline in action.

---

## Evaluation Criteria:
1. **Automation**: Level of automation achieved for deployment and CI/CD.
2. **Infrastructure**: Correct configuration of the infrastructure with a focus on high availability and scalability.
3. **Security**: Implementation of AWS security best practices.
4. **Monitoring**: Configuration of tools to monitor the state of the infrastructure and application.
5. **Presentation**: Clarity and quality of the documentation and live demo.
