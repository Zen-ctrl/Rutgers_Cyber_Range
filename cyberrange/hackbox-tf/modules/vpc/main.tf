resource "aws_vpc" "vpc" {
  cidr_block           = try(var.vpc_cidr, null)
  enable_dns_hostnames = try(var.enable_dns_hostnames, null)
  enable_dns_support   = try(var.enable_dns_support, null)
  assign_generated_ipv6_cidr_block = try(var.assign_generated_ipv6_cidr_block, null)
  tags = merge(
    { 
      "Name"    = "${var.vpc_name}" 
      "Service" = "VPC" 
    }, 
    try(var.tags, null)
  )
}

resource "aws_default_route_table" "main_route_table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  route = []
  tags = merge(
    { 
      "Name"    = "${var.vpc_name}-default-rt" 
      "Service" = "Default Route Table" 
    }, 
    try(var.tags, null)
  )
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    { 
      "Name"    = "${var.vpc_name}-internet-gw" 
      "Service" = "Internet Gateway" 
    }, 
    try(var.tags, null)
  )
}

resource "aws_subnet" "public" {
  count                   = try(length(var.public_cidr_blocks), 0)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_cidr_blocks[count.index]
  availability_zone       = var.public_availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = merge(
    { 
      "Name"    = "${var.vpc_name}-public-subnet-0${count.index+1}" 
      "Service" = "Public Subnet" 
    }, 
    try(var.tags, null)
  )
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_subnet" "private" {
  count                   = try(length(var.private_cidr_blocks), 0)
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_cidr_blocks[count.index]
  availability_zone       = var.private_availability_zones[count.index]
  tags = merge(
    { 
      "Name"    = "${var.vpc_name}-private-subnet-0${count.index+1}" 
      "Service" = "Private Subnet" 
    }, 
    try(var.tags, null)
  )
}

resource "aws_eip" "nat_eip" {
  count    = var.enable_nat == true ? 1 : 0
  vpc      = true
  tags = merge(
    { 
      "Name"    = "${var.vpc_name}-nat-eip" 
      "Service" = "NAT GW EIP" 
    }, 
    try(var.tags, null)
  )
}

resource "aws_nat_gateway" "nat_gw" {
  count    = var.enable_nat == true ? 1 : 0
  allocation_id = aws_eip.nat_eip[0].id
  subnet_id     = aws_subnet.public[0].id
  tags = merge(
    { 
      "Name"    = "${var.vpc_name}-nat-gw" 
      "Service" = "NAT Gateway" 
    }, 
    try(var.tags, null)
  )
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_route_table" "public_subnet-to-igw_route" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    { 
      "Name"    = "${var.vpc_name}-public-route-table" 
      "Service" = "Route Table" 
    }, 
    try(var.tags, null)
  )
}

resource "aws_route" "route-public" {
  route_table_id            = aws_route_table.public_subnet-to-igw_route.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.gw.id
  depends_on                = [aws_route_table.public_subnet-to-igw_route]
}

resource "aws_route_table_association" "public_subnet-assoc" {
  count          = try(length(var.public_cidr_blocks), 0)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public_subnet-to-igw_route.id
}

resource "aws_route_table" "private_subnets-to-internet_route" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    { 
      "Name"    = "${var.vpc_name}-private-route-table" 
      "Service" = "Route Table" 
    }, 
    try(var.tags, null)
  )
}

resource "aws_route" "route-private" {
  count                     = var.enable_nat == true ? 1 : 0
  route_table_id            = aws_route_table.private_subnets-to-internet_route.id
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id            = aws_nat_gateway.nat_gw[0].id
  depends_on                = [aws_route_table.private_subnets-to-internet_route]
}

resource "aws_route_table_association" "private_subnet-assoc" {
  count          = var.enable_nat == true ? try(length(var.private_cidr_blocks), 0) : 0
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private_subnets-to-internet_route.id
}