locals {
  resource_name="${var.Project}-${var.Environment}"
}
locals {
  bastion_sg_id = data.aws_ssm_parameter.bastion_sg_id.value
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0]
  ami_id = data.aws_ami.joindevops.id
}