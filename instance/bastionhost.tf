resource "aws_instance" "bastion" {
  ## Ubuntu 18 LTS AMI
  ami             = "ami-074251216af698218"
  key_name        = aws_key_pair.deployer.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.bastion-sg.id]

  #associate_public_ip_address = true
  subnet_id = var.public_subnets[0]

 

}

resource "aws_ec2_tag" "bastiantag" {
  resource_id = aws_instance.bastion.id
  key         = "Name"
  value       = "Bastion_Server"
}

resource "aws_eip" "bas_ip" {
  vpc = true
  tags = {
    Name = "bastian_eip"
  }

}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.bastion.id
  allocation_id = aws_eip.bas_ip.id
}

resource "aws_security_group" "bastion-sg" {

  name   = "bastion-security-group"
  vpc_id = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}