output "instance_ip" {
  value       = aws_instance.instance.public_ip
  description = "It will output istances public ip"
}

output "security_group_id" {
  value       = aws_security_group.public_sg.id
  description = "It will output security group's public_sg id"
}