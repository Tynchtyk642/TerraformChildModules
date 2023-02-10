resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  security_groups             = [var.sg]
  associate_public_ip_address = true
  subnet_id                   = var.public_subnet
  tags = {
    Name = "${var.env}-bastion_host"
  }
}
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["704109570831"]
} 