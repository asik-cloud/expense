variable "common_tags" {
    default = {
        Project = "expense"
        Environemt = "dev"
        terraform = true
    }
}
variable "Project" {
    default = "expense"
}
variable "Environment" {
    default = "dev"
}
variable "mysql_sg_tags" {
  default = {
    component = "mysql"
  }
}
variable "backend_sg_tags" {
  default = {
    component = "backend"
  }
}
variable "frontend_sg_tags" {
  default = {
    component = "frontend"
  }
}
variable "bastion_sg_tags" {
  default = {
    component = "bastion"
  }
}
variable "ansible_sg_tags" {
  default = {
    component = "ansible"
  }
}
