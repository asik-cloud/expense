variable "AMI" {

    type = string
    default = "ami-0b4f379183e5706b9"

  
}

variable "INS_TYPE" {

    type = string
    default = "t2.micro"
  
}

variable "INS_NAMES" {

    type = map
    default = { 
        
      mysql ="t3.small"
      backend ="t2.micro"
      frontend="t2.micro"
}
}

variable "ZONE_ID" {
    
    type = string
    default = "Z04890181CXTIAWV1SUNA"
  
}

variable "DNS" {

    type = string
    default = "mohammedasik.shop"
  
}