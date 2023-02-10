//✎﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏𝐕𝐀𝐑𝐈𝐀𝐁𝐋𝐄𝐒﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
variable "env" {
  type = string
  description = "specified resources enviroment"
}
variable "ec2_type" {
  type        = string
  default     = "t2.micro"
  description = "Bastion instance type"
}
variable "public_subnet" {
  type = string
  default = ""
  description = "CIDR of the public subnet"
}
variable "ec2-sg" {
  type = string 
  default = ""
  description = "ID of the security group"
}