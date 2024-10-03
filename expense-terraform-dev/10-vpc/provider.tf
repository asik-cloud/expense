terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "expense-devops-asik-s3"
    key            = "vpc-module"
    region         = "us-east-1"
    dynamodb_table = "tfstate-locking"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
