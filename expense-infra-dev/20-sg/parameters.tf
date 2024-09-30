resource "aws_ssm_parameter" "backend_sg_id" {
    name = "/${var.Project}/${var.Environment}/backend_sg_id"
    type = "String"
    value = module.backend_sg.id
}
resource "aws_ssm_parameter" "mysql_sg_id" {
    name = "/${var.Project}/${var.Environment}/mysql_sg_id"
    type = "String"
    value = module.mysql_sg.id
}
resource "aws_ssm_parameter" "frontend_sg_id" {
    name = "/${var.Project}/${var.Environment}/frontend_sg_id"
    type = "String"
    value = module.frontend_sg.id
}
resource "aws_ssm_parameter" "bastion_sg_id" {
    name = "/${var.Project}/${var.Environment}/bastion_sg_id"
    type = "String"
    value = module.bastion_sg.id
}
resource "aws_ssm_parameter" "ansible_sg_id" {
    name = "/${var.Project}/${var.Environment}/ansible_sg_id"
    type = "String"
    value = module.ansible_sg.id
}