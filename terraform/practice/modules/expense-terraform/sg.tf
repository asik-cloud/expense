module "mysql_sg" {

source = "../expense-modules/terraform-aws_security_group"
Project = var.Project
Environemt = var.Environment
sg_name = "mysql"
common_tags = var.common_tags
vpc_id = module.vpc.vpc_id
sg_tags = var.mysql_sg_tags
}