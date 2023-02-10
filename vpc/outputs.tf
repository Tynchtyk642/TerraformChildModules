output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "id of created vpc"
}
output "subnets_private" {
  value       = aws_subnet.private[*].id
  description = "ids of private subnets"
}
output "subnets_public" {
  value       = aws_subnet.public[*].id
  description = "ids of public subnets"
}