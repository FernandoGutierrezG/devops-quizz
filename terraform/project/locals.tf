# project/main.tf
# Fernando Gutierrez

locals {
  aws_region                = "us-east-1"
  ecs_role_name             = "python-app-ECSTaskExecutionRole"
  ecs_cluster_name          = "python-app-ecs-cluster"
  ecs_repo_name             = "python-app-ecr"
  ecs_service_name          = "python-app-service1"
  ecs_task_family           = "python-app-task1"
  ecs_container_definitions = file("container_definitions.json")
  ecs_cpu                   = "256"
  ecs_memory                = "512"
  ecs_assign_public_ip      = false
  ecs_container_name        = "python-app-container"
  ecs_container_port        = 8000
  ecs_desired_task_count    = 2

  route53_domain_name            = "fertechnologies.com"
  route53_subdomain              = "www"
  route53_create_ssl_certificate = true
}