resource "aws_vpc" "main" {
  cidr_block = var.cidr_blocks
  enable_dns_hostnames = true
  tags = merge(
    var.common_tags,
    var.vpc_tags,
    {
        Name = "${local.resource_name}-vpc"
    }
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = merge(
    var.common_tags,
    var.igw_tags,
    {
        Name = "${local.resource_name}-igw"
    }
  )
}

resource "aws_subnet" "public_st" {
  count = length(var.public_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = local.az_zones[count.index]
  map_public_ip_on_launch = true
  tags = merge(
    var.common_tags,
    var.public_subnet_tags,
    {
        Name = "${local.resource_name}-public-${local.az_zones[count.index]}"
    }
  )
}

resource "aws_subnet" "private_st" {
  count = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[count.index]
  availability_zone = local.az_zones[count.index]
  tags = merge(
    var.common_tags,
    var.private_subnet_tags,
    {
        Name = "${local.resource_name}-private-${local.az_zones[count.index]}"
    }
  )
}
resource "aws_subnet" "db_st" {
  count = length(var.db_subnet_cidrs)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.db_subnet_cidrs[count.index]
  availability_zone = local.az_zones[count.index]
  tags = merge(
    var.common_tags,
    var.db_subnet_tags,
    {
        Name = "${local.resource_name}-db-${local.az_zones[count.index]}"
    }
  )
}

resource "aws_db_subnet_group" "default" {
  name       = local.resource_name
  subnet_ids = aws_subnet.db_st[*].id

    tags = merge(
    var.common_tags,
    var.db_subnet_group_tags,
    {
        Name = local.resource_name
    }
    )
}

resource "aws_eip" "nat" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.nat.id
   subnet_id     = aws_subnet.public_st[0].id

  tags = merge(
    var.common_tags,
    var.nat_gateway_tags,
    {
        Name = local.resource_name
    }
  )

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

#public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
    tags = merge(
        var.common_tags,
        var.public_rt_tags,
        {
            Name = "${local.resource_name}-public"
        }
    )
}

#private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
    tags = merge(
        var.common_tags,
        var.private_rt_tags,
        {
            Name = "${local.resource_name}-private"
        }
    )
}

#db Route Table
resource "aws_route_table" "db" {
  vpc_id = aws_vpc.main.id
    tags = merge(
        var.common_tags,
        var.db_rt_tags,
        {
            Name = "${local.resource_name}-db"
        }
    )
}

#public routes
resource "aws_route" "public" {
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

#private routes
resource "aws_route" "private" {
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.natgw.id
}

#db routes
resource "aws_route" "db" {
  route_table_id            = aws_route_table.db.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.natgw.id
}

resource "aws_route_table_association" "pbrta" {
  count = length(var.public_subnet_cidrs)  
  subnet_id      = aws_subnet.public_st[count.index].id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "pvrta" {
  count = length(var.private_subnet_cidrs)  
  subnet_id      = aws_subnet.private_st[count.index].id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "dbrta" {
  count = length(var.private_subnet_cidrs)   
  subnet_id      = aws_subnet.db_st[count.index].id
  route_table_id = aws_route_table.db.id
}

