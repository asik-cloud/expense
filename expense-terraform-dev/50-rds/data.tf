data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/${var.Project}/${var.Environment}/mysql_sg_id"
}
data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.Project}/${var.Environment}/public_subnet_ids"
}
