# iam/variables.tf
# Fernando Gutierrez

variable "aws_region" {
  type    = string
  default = "us-east-1"
}
variable "vpc_id" {
  description = "Id of the VPC"
}
variable "ft_public_subnets" {
  description = "The public subnet"
}

variable "ssl_certificate" {
  description = "aws_acm_certificate"
}
