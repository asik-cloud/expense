data "aws_ami" "AMI" {

   most_recent = true
  owners      = [973714476881]

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
  
}