

data "aws_availability_zones" "available" {
  state = "available"
}

# Public Subnets
resource "aws_subnet" "public" {
  count = var.public_subnets_count

  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, var.subnet_cidr_bits, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name                                           = "${var.env}-public-sg"
    "kubernetes.io/cluster/${var.env}-cluster" = "shared"
    "kubernetes.io/role/elb"                       = 1
    environment = var.env
  }

  map_public_ip_on_launch = true
}

# Private Subnets
resource "aws_subnet" "private" {
  count = var.private_subnets_count

  vpc_id            = aws_vpc.main.id
  cidr_block        = cidrsubnet(var.vpc_cidr, var.subnet_cidr_bits, count.index + var.public_subnets_count)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name                                           = "${var.env}-private-sg"
    "kubernetes.io/cluster/${var.env}-cluster" = "shared"
    "kubernetes.io/role/internal-elb"              = 1
    environment = var.env
  }
}