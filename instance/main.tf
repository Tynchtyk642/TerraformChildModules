#==========final project child root============
#
# here configured bastion 
#==============================================
#  Made by Mintemir Kurbanaliev . February 2023


#############################
##                         ##
## using conditon number 2 ##
##                         ##
#############################

  variable "use_bastion" {
  default = true
}

resource "aws_instance" "bastion" {
  ami             = data.aws_ami.latest_ubuntu.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.security.id]
  subnet_id     = var.public_subnet_ids
  tags = {
    Name = "${var.env}-bastion"
  }
    condition = var.use_bastion
}





data "aws_ami" "latest_ubuntu" {
  owners      = ["099720109477"]
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230115*"]
  }
}