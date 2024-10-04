resource "aws_ssm_parameter" "vpc_id" {
    name = "/${var.Project}/${var.Environment}/vpc_id"
    type = "String"
    value = module.vpc.vpc_id
}
resource "aws_ssm_parameter" "public_subnet_ids" {
    name = "/${var.Project}/${var.Environment}/public_subnet_ids"
    type = "StringList"
    value = join(",", module.vpc.public_subnet)
}
resource "aws_ssm_parameter" "private_subnet_ids" {
    name = "/${var.Project}/${var.Environment}/private_subnet_ids"
    type = "StringList"
    value = join(",", module.vpc.private_subnet)
}
resource "aws_ssm_parameter" "database_subnet_ids" {
    name = "/${var.Project}/${var.Environment}/database_subnet_ids"
    type = "StringList"
    value = join(",", module.vpc.db_subnet)
}
resource "aws_ssm_parameter" "db_subnet_group_name" {
    name = "/${var.Project}/${var.Environment}/db_subnet_group_name"
    type = "String"
    value = module.vpc.db_subnet_group_name
}