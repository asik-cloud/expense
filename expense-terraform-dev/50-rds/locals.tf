locals {
  resource_name="${var.Project}-${var.Environment}"
}
locals {
  mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
  db_subnet_group_name = data.aws_ssm_parameter.db_subnet_group_name.value
}