output "vpc_id" {
    value = aws_vpc.main.id
}
output "public_subnet" {
    value = aws_subnet.public_st[*].id
}
output "private_subnet" {
    value = aws_subnet.private_st[*].id
}
output "db_subnet" {
    value = aws_subnet.db_st[*].id
}
output "eip" {
    value = aws_eip.nat.public_ip
}
output "nat" {
    value = aws_nat_gateway.natgw.id
}