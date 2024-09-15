# variable "AMI" {

#     type = string
#     default = "ami-0b4f379183e5706b9"

  
# }

variable "INS_TYPE" {

    type = string
    default = "t2.micro"
  
}

variable "INS_NAMES" {

    type = list(string)
    default = [ "mysql", "backend", "frontend" ]
  
}