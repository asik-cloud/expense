resource "aws_instance" "expense" {

  ami                    = var.AMI
  instance_type          = var.INS_TYPE
  vpc_security_group_ids = [aws_security_group.expense_allow_all.id]


}

