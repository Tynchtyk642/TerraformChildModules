output "instance_pub_ip" {
  value = aws_instance.ec2.public_ip
}