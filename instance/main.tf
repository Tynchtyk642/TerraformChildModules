resource "aws_instance" "bastion" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.vpc_subnet_id
  tags = {
    Name = "${var.tag_bastion}-final_project"
  }
}

# Security group for public subnet
resource "aws_security_group" "bastion_sg" {
   
  name        = "bastion_sg"
  description = "Allow incoming SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


}