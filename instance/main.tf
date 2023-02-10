resource "aws_instance" "bastion" {
  ami = var.ami
  # key_name                    = "key"
  subnet_id                   = var.subnet_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = ["${var.bastion_sg}"]
  associate_public_ip_address = true

  tags = {
    "environment" = "${var.project}"
  }
}