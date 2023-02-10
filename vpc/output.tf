
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}
output "private_ids" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private[*].id
}
output "public_ids" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.public[*].id
}
output "public_cidrs" {
  description = "The IPv4 CIDR blocks for the public subnets."
  value       = aws_subnet.public.*.cidr_block
}
output "private_cidrs" {
  description = "The IPv4 CIDR blocks for the private subnets."
  value       = aws_subnet.private.*.cidr_block
}