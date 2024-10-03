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

variable "bastion_tags" {
  default = {
    component = "bastion"
  }
}
