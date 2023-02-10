output public_subnets {
  value       = aws_subnet.public_subnets.*.id

  description = "outputs of public subnets id "
}
 
output "vpc_id" {

  value       = aws_vpc.main.id
  description = "outputs of vpc id "
}

output "private_subnets" {

  value       = aws_subnet.private_subnets.*.id
  description = "outputs of public subnets id "
}