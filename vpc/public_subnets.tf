# Public Subnets
resource "aws_subnet" "public" {
  count = length(var.public_subnet)

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name                                           = "${var.project}-public-sg"
    "kubernetes.io/cluster/${var.project}-cluster" = "shared"
    "kubernetes.io/role/elb"                       = 1
  }

  map_public_ip_on_launch = true
}
