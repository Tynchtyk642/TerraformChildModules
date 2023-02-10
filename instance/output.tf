output "ec2" {
    value = aws_instance.bastion.id
    description = "output of instance id"  
}