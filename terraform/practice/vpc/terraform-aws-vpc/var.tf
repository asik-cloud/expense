variable "cidr_blocks" {
  type = string
}
variable "common_tags" {
    default = {}
}
variable "Project" {
    type = string
}
variable "Environment" {
    type = string
}
variable "vpc_tags" {
    default = {}
}
variable "igw_tags" {
    default = {}
}
variable "public_subnet_cidrs" {
    type = list
    validation {
      condition = length(var.public_subnet_cidrs) == 2
      error_message = "Public subnet cidr should only be 2"
    }
}
variable "public_subnet_tags" {
    default = {}
}
variable "private_subnet_cidrs" {
    type = list
    validation {
    condition = length(var.private_subnet_cidrs) == 2
    error_message = "Private subnet cidr should only be 2"
    }
}
variable "private_subnet_tags" {
    default = {}
}
variable "db_subnet_cidrs" {
    type = list
    validation {
    condition = length(var.db_subnet_cidrs) == 2
    error_message = "Database subnet cidr should only be 2"
}
}
variable "db_subnet_tags" {
    default = {}
}
variable "db_subnet_group_tags" {
    default =  {}
}
variable "nat_gateway_tags" {
    default = {}
}
variable "public_rt_tags" {
    default = {} 
}
variable "private_rt_tags" {
    default = {} 
}
variable "db_rt_tags" {
    default = {} 
}