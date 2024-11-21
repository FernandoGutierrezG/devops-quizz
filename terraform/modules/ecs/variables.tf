# iam/variables.tf
# Fernando Gutierrez

variable "vpc_id" {}
variable "private_subnets" {}
variable "ecs_execution_role_arn" {}
variable "cluster_name" {}
variable "repo_name" {}
variable "service_name" {}
variable "task_family" {}
variable "container_definitions_file" { type = string }
variable "cpu" {}
variable "memory" {}
variable "assign_public_ip" { default = false }
variable "target_group_arn" {}
variable "container_name" {}
variable "container_port" {}
variable "desired_task_count" {}
