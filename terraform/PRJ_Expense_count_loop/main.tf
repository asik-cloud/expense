resource "aws_instance" "Expense" {
  count                  = length(var.INS_NAMES)
  ami                    = data.aws_ami.AMI.id
  instance_type          = var.INS_NAMES[count.index] == "mysql" ? "t3.small" : "t2.micro"
  vpc_security_group_ids = [aws_security_group.expense_sg.id]

  tags = {

  Name = var.INS_NAMES[count.index] }


}
resource "aws_route53_record" "expense_r53" {

  count           = length(var.INS_NAMES)
  zone_id         = var.ZONE_ID
  name            = "${var.INS_NAMES[count.index]}.${var.DNS}"
  type            = "A"
  ttl             = 5
  records         = [var.INS_NAMES[count.index] == "frontend" ? aws_instance.Expense[count.index].public_ip : aws_instance.Expense[count.index].private_ip]
  allow_overwrite = true
}


