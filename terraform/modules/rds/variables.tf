# iam/variables.tf
# Fernando Gutierrez

variable "aws_region" {
  type = string
  default = "us-east-1"
}
variable "ft_public_subnets" {
  description = "The public subnet"
}

variable "ft_security_group" {
  description = "The project security group"
}


variable "ecs_execution_role_arn" {}
variable "vpc_id" {}
variable "domain_name" {
  description = "The domain name for the SSL certificate"
  default     = "example.com"
}
