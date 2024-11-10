# iam/variables.tf
# Fernando Gutierrez

variable "vpc_cidr_block" {
  type    = string
  default = "172.16.0.0/16"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
  default     = ["172.16.0.0/20", "172.16.16.0/20"]
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list(string)
  default     = ["172.16.32.0/20", "172.16.48.0/20"]
}

variable "db_subnets" {
  description = "Database subnet CIDRs"
  type        = list(string)
  default     = ["172.16.64.0/20", "172.16.80.0/20"]
}