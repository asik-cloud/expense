resource "aws_instance" "Expense" {

  for_each               = var.INS_NAMES
  ami                    = data.aws_ami.AMI.id
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.expense_sg.id]

  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "Expense_r53" {

  for_each = aws_instance.Expense
  zone_id = var.ZONE_ID
  name    = "${var.INS_NAMES[each.key]}.${var.DNS}"
  type    = "A"
  ttl     = 5
  records = [each.key=="frontend" ? each.value.public_ip : each.value.private_ip]
  allow_overwrite = true
}