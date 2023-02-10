output "subnet_id" {
 description = "output of public subnets" 
  value = aws_subnet.public_subnets[*].id
}
output "vpc_id" {
  value = aws_vpc.vpc.id
   description = "output of vpc id"
}
output "private_subnet_id" {
  value = aws_subnet.private_subnets[*].id
  description = "output of private subnets" 
}