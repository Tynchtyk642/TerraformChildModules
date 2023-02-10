# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = "${var.env}-igw"
    environment = var.env
  }

  depends_on = [aws_vpc.main]
}

# Route Table(s)
# Route the public subnet traffic through the IGW
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.env}-Default-rt"
    environment = var.env
  }
}
//for change
# Route table and subnet associations
resource "aws_route_table_association" "internet_access" {
  count = var.public_subnets_count

  subnet_id      = element(aws_subnet.public, count.index).id
  route_table_id = aws_route_table.main.id
}

# NAT Elastic IP
resource "aws_eip" "main" {
  vpc = true

  tags = {
    Name = "${var.env}-ngw-ip"
    environment = var.env
  }
}

# NAT Gateway
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = element(aws_subnet.public, 0).id

  tags = {
    Name = "${var.env}-ngw"
    environment = var.env
  }
}

# Add route to route table
resource "aws_route" "main" {
  route_table_id         = aws_vpc.main.default_route_table_id
  nat_gateway_id         = aws_nat_gateway.main.id
  destination_cidr_block = "0.0.0.0/0"
}
