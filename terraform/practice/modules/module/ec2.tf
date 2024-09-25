module "ec2" {

  source = "../sourcecode"

  ami_id       = var.ami_id_m
  instance_type = var.instance_type_m
  
  
}
