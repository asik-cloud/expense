locals {
  resource_name = "${var.Project}-${var.Environment}"
  az_zones = slice(data.aws_availability_zones.available.names, 0, 2)
}