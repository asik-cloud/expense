resource "aws_instance" "expense" {

  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.expense_allow_all.id]


}

