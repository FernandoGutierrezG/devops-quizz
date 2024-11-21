# project/providers.tf
# Fernando Gutierrez

provider "aws" {
  region = local.aws_region
}

terraform {
  backend "s3" {
    bucket  = "fertechbucket"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
