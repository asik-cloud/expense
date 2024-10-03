module "mysql" {
  source = "terraform-aws-modules/ec2-instance/aws"
  ami    = local.ami_id
  name   = "${local.resource_name}-mysql"

  instance_type = "t3.micro"

  vpc_security_group_ids = [local.mysql_sg_id]
  subnet_id              = local.database_subnet_id

  tags = merge(
    var.common_tags,
    var.mysql_tags,
    {
      Name = "${local.resource_name}-mysql"
    }
  )
}

module "frontend" {
  source = "terraform-aws-modules/ec2-instance/aws"
  ami    = local.ami_id
  name   = "${local.resource_name}-frontend"

  instance_type = "t3.micro"

  vpc_security_group_ids = [local.frontend_sg_id]
  subnet_id              = local.public_subnet_id

  tags = merge(
    var.common_tags,
    var.frontend_tags,
    {
      Name = "${local.resource_name}-frontend"
    }
  )
}

module "backend" {
  source = "terraform-aws-modules/ec2-instance/aws"
  ami    = local.ami_id
  name   = "${local.resource_name}-backend"

  instance_type = "t3.micro"

  vpc_security_group_ids = [local.backend_sg_id]
  subnet_id              = local.private_subnet_id

  tags = merge(
    var.common_tags,
    var.backend_tags,
    {
      Name = "${local.resource_name}-backend"
    }
  )
}

module "ansible" {
  source = "terraform-aws-modules/ec2-instance/aws"
  ami    = local.ami_id
  name   = "${local.resource_name}-ansible"
  user_data = file("expense.sh")

  instance_type = "t3.micro"

  vpc_security_group_ids = [local.ansible_sg_id]
  subnet_id              = local.public_subnet_id

  tags = merge(
    var.common_tags,
    var.ansible_tags,
    {
      Name = "${local.resource_name}-ansible"
    }
  )
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"

  zone_name = var.zone_name

  records = [
    {
      name    = "frontend"
      type    = "A"
      ttl     = 5
      records = [module.frontend.public_ip]
    },
    {
      name    = "backend"
      type    = "A"
      ttl     = 5
      records = [module.backend.private_ip]
    },
    {
      name    = "mysql"
      type    = "A"
      ttl     = 5
      records = [module.mysql.private_ip]
    }
  ]
}
