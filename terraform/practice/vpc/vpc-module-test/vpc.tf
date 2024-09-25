module "vpc" {

 source = "../terraform-aws-vpc"
 cidr_blocks = "10.0.0.0/16"
 common_tags = var.common_tags
 Project = var.Project
 Environment = var.Environment
 public_subnet_cidrs = var.public_subnet_cidrs
 private_subnet_cidrs = var.private_subnet_cidrs
 db_subnet_cidrs = var.db_subnet_cidrs
}