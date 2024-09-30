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
variable "vpc_tags" {
    default = {}
}
variable "igw_tags" {
    default = {}
}
variable "public_subnet_cidrs" {
    default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "public_subnet_tags" {
    default = {}
}
variable "private_subnet_cidrs" {
    default = ["10.0.11.0/24","10.0.12.0/24"]
}
variable "private_subnet_tags" {
    default = {}
}
variable "db_subnet_cidrs" {
    default = ["10.0.21.0/24","10.0.22.0/24"]
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
variable "peering_tags" {
    default = {}  
}
variable "is_peering_required" {
    default = true
}