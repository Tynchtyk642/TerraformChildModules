data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name          = "${var.prefix}-vpc"
    "environment" = var.env_tag
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name          = "${var.prefix}-igw"
    "environment" = var.env_tag
  }
}


resource "aws_subnet" "public_subnets" {
  count                   = var.public_subnets
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[count.index]


  tags = {
    Name                                       = "public-subnet${var.prefix}-${count.index + 1}"
    "kubernetes.io/role/elb"                   = 1
    "environment"                              = var.env_tag
    "kubernetes.io/cluster/${var.env_tag}-eks" = "shared"

  }
}



resource "aws_subnet" "private_subnets" {
  count                   = var.private_subnets
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_cidrs[count.index]
  map_public_ip_on_launch = false
  availability_zone       = data.aws_availability_zones.available.names[count.index]


  tags = {
    Name                                       = "private-subnet-${var.prefix}-${count.index + 1}"
    "kubernetes.io/role/internal-elb"          = 1
    "environment"                              = var.env_tag
    "kubernetes.io/cluster/${var.env_tag}-eks" = "shared"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name          = "${var.prefix}-public-rt"
    "environment" = var.env_tag
  }
}

resource "aws_route" "public_igw" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  route_table_id         = aws_route_table.public_route_table.id


  timeouts {
    create = "5m"
  }
}

resource "aws_route_table_association" "public_assoc" {
  count          = var.public_subnets
  subnet_id      = aws_subnet.public_subnets.*.id[count.index]
  route_table_id = aws_route_table.public_route_table.id
}



resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name          = "${var.prefix}-private-rt"
    "environment" = var.env_tag
  }
}

resource "aws_route" "private_nat_gateway" {
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
  route_table_id         = aws_route_table.private_route_table.id

  timeouts {
    create = "5m"
  }
}

resource "aws_route_table_association" "private_assoc" {
  count          = var.private_subnets
  subnet_id      = aws_subnet.private_subnets.*.id[count.index]
  route_table_id = aws_route_table.private_route_table.id
}



resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnets[0].id
  tags = {
    Name          = "${var.prefix}-nat-gw"
    "environment" = var.env_tag
  }
}

resource "aws_eip" "nat_eip" {
  tags = {
    Name          = "eip-for-nat"
    "environment" = var.env_tag
  }
}
