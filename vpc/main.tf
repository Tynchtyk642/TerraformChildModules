
# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name                                           = "${var.env}-vpc",
    "kubernetes.io/cluster/${var.env}-cluster" = "shared"
    environment = var.env
  }
}