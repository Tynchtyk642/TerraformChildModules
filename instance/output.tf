output "aws_instance_bastion" {
    description = "Provides an EC2 instance resource. This allows instances to be created"
    value = aws_instance.bastion
  
}

output "aws_security_group_bastion_sg" {
    description = "This sg allows to access our bastion host"

    value = aws_security_group.bastion_sg
  
}