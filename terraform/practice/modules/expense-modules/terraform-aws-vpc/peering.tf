#peering from our(main) vpc to defualt vpc

resource "aws_vpc_peering_connection" "peering" {
  count = var.is_peering_required ? 1 : 0
  peer_vpc_id   = data.aws_vpc.default.id
  vpc_id        = aws_vpc.main.id
  auto_accept   = true

  tags = merge(
    var.common_tags,
    var.peering_tags,
    {
        Name = "${local.resource_name}-peering"
    }
  )
}
resource "aws_route" "public_peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}
resource "aws_route" "private_peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}
resource "aws_route" "db_peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.db.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}
resource "aws_route" "defualt_peering" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = data.aws_route_table.main.route_table_id
  destination_cidr_block    = var.cidr_blocks
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[count.index].id
}