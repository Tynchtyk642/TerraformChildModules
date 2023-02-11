
# VPC 
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name                                       = "${var.env}-vpc",
    "kubernetes.io/cluster/${var.env}-cluster" = "shared"
  }
}
# Internet Gateway 
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    "Name" = "${var.env}-igw"
  }

  depends_on = [aws_vpc.vpc]
}

# Route Table(s) 
# Route the public subnet traffic through the IGW 
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.env}-Default-rt"
  }
}
//for change 
# Route table and subnet associations 
resource "aws_route_table_association" "internet_access" {
  count = var.public_subnets_count

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.main.id
}

# NAT Elastic IP 
resource "aws_eip" "main" {
  vpc = true

  tags = {
    Name = "${var.env}-ngw-ip"
  }
}

# NAT Gateway 
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.env}-ngw"
  }
}

# Add route to route table 
resource "aws_route" "main" {
  route_table_id         = aws_vpc.vpc.default_route_table_id
  nat_gateway_id         = aws_nat_gateway.main.id
  destination_cidr_block = "0.0.0.0/0"
}