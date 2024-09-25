variable "ami_id_m" {
    type = string
    default = "ami-0b4f379183e5706b9"
  
}

variable "instance_type_m" {
  description = "Instance type of the server"

  validation {
    condition     = contains(["t3.small", "t2.micro", "t3.medium"], var.instance_type_m)
    error_message = "The instance_type must be in 't3.small', 't2,micro', 't3.medium'."
  }
}