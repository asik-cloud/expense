output "vpc_id" {
    value = module.vpc.vpc_id
}
output "public_subnet" {
    value = module.vpc.public_subnet
}
output "db_subnet" {
    value = module.vpc.db_subnet
}
output "private_subnet" {
    value = module.vpc.private_subnet
}
output "eip" {
    value = module.vpc.eip
}
output "nat" {
    value = module.vpc.nat
}