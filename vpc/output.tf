//✎﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏𝐎𝐔𝐓𝐏𝐔𝐓𝐒﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
output "aws_vpc" {
  value = aws_vpc.jeks.id
  description = "output of vpc id" 
}
output "aws_subnet" {
  value = aws_subnet.pub1.*.id
  description = "output of public subnet id" 
}
output "private_subnets" {
  value = aws_subnet.priv1.*.id
  description = "output of private subnet id" 
  
}
output "sg-for-bastion-host" {
  value = aws_security_group.js-sg.id
  description = "output of security group" 
  
}