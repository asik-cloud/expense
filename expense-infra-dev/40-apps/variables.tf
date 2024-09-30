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

variable "mysql_tags" {
  default = {
    component = "mysql"
  }
}
variable "frontend_tags" {
  default = {
    component = "frontend"
  }
}
variable "backend_tags" {
  default = {
    component = "backend"
  }
}
variable "ansible_tags" {
  default = {
    component = "ansible"
  }
}
variable "zone_name" {
  default = "mohammedasik.shop"
}