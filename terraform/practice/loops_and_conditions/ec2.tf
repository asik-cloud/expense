resource "aws_instance" "expense" {

  count                  = length(var.INS_NAMES)
  ami                    = data.aws_ami.AMI.id
  instance_type          = var.INS_TYPE
  vpc_security_group_ids = [aws_security_group.expense_allow_all.id]
  tags = {
    Name=var.INS_NAMES[count.index]}

}



