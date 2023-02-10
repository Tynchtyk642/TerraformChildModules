
output "vpc_id" {
  value = aws_vpc.this.id
  description = "virtual network ids"
  
}

output "public_subnet_id" {
  value = aws_subnet.public[*].id
  description = "public subnet ids"
}

output "private_subnet_id" {
  value = aws_subnet.private[*].id
  description = "private subnets ids"
}

output "project" {
  value = var.project
  description = "vpc's deployment name"
  
}


