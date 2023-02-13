variable "instance_type" {
  description = "instancetype of our EC2"

  type    = string
  default = "t2.micro"
}

variable "vpc_subnet_id" {
  description = "It provides subnet ID from VPC"
  type    = string
}

variable "ami" {
    description = "Ami for our bastion host"

    type = string
    default = "ami-0aa7d40eeae50c9a9"
  
}
variable "tag_bastion" {
    type = string
    default = "Bastion"
  
}