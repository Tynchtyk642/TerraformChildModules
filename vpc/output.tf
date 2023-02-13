

output "aws_subnet_public" {
  description = "Provides an VPC subnet resource."

  value = aws_subnet.public[*].id
  }

output "aws_subnet_private" {
  description = "Provides an VPC subnet resource."
  value = aws_subnet.private[*].id
  }


output "vpc_id" {
  description = "The vpc_id is used to refer to a specific VPC within an AWS account"
  value = aws_vpc.this.id
  
}

output "aws_internet_gateway" {
  description = "Provides a resource to create a VPC Internet Gateway"
  value = aws_internet_gateway.this
  
}


output "private_ids" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private[*].id
}
output "public_ids" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.public[*].id
  }



