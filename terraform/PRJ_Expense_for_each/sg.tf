resource "aws_security_group" "expense_sg" {

    name = "expense_sg"

ingress {

    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

}
egress {

    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

}
  
}