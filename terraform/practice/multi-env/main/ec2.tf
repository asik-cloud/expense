resource "aws_instance" "expense" {
  for_each = var.INS_NAMES
  ami                    = var.AMI
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.expense_allow_all.id]

  tags = {

    Name = each.key
  }

}

resource "aws_route53_record" "expense_r53" {
  for_each = aws_instance.expense
  zone_id = var.ZONE_ID
  name    = "${each.key}.${var.DNS}"
  type    = "A"
  ttl     = 5
  records = [each.key == "frontend-prod" ? each.value.public_ip : each.value.private_ip]
  allow_overwrite = true
}


