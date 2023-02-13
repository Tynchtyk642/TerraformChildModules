output "vpc_id" {
  value       = aws_vpc.my-vpc.id
  description = "Identification of VPC"
}
output "public_subnet_ids" {
  value       = aws_subnet.subnet1.*.id
  description = "Identification of subnet"
}

output "private-subnet-id" {
  value       = aws_subnet.private-subnets.*.id
  description = "Identification of private subnet"
}


