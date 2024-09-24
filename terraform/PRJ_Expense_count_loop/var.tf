variable "INS_NAMES" {

    type = list(string)
    default = [ "mysql", "frontend", "backend" ]
  
}

variable "ZONE_ID" {

    type = string
    default = "Z04890181CXTIAWV1SUNA"
  
}

variable "DNS" {

    type = string
    default = "mohammedasik.shop"
  
}