variable "INS_NAMES" {

    type = map
    default = {
        mysql = "t3.small"
        frontend = "t2.micro"
        backend = "t2.micro"
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