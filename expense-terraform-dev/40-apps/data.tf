data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.Project}/${var.Environment}/bastion_sg_id"
}
data "aws_ssm_parameter" "backend_sg_id" {
  name = "/${var.Project}/${var.Environment}/backend_sg_id"
}
data "aws_ssm_parameter" "frontend_sg_id" {
  name = "/${var.Project}/${var.Environment}/frontend_sg_id"
}
data "aws_ssm_parameter" "mysql_sg_id" {
  name = "/${var.Project}/${var.Environment}/mysql_sg_id"
}
data "aws_ssm_parameter" "ansible_sg_id" {
  name = "/${var.Project}/${var.Environment}/ansible_sg_id"
}
data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.Project}/${var.Environment}/public_subnet_ids"
}
data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.Project}/${var.Environment}/private_subnet_ids"
}
data "aws_ssm_parameter" "database_subnet_ids" {
  name = "/${var.Project}/${var.Environment}/database_subnet_ids"
}
data "aws_ami" "joindevops" {

	most_recent      = true
	owners = ["973714476881"]
	
	filter {
		name   = "name"
		values = ["RHEL-9-DevOps-Practice"]
	}
	
	filter {
		name   = "root-device-type"
		values = ["ebs"]
	}

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}