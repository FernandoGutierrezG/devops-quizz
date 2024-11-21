# project/providers.tf
# Fernando Gutierrez

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.32.0"
    }
  }
}

provider "aws" {
  region = local.aws_region
}
