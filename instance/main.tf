resource "aws_instance" "instance" {
  ami                    = "ami-0aa7d40eeae50c9a9"
  instance_type          = "t2.micro"
  subnet_id              = var.public_ids[1]
  vpc_security_group_ids = [aws_security_group.public_sg.id]

  tags = {

    environment = var.env
    Name        = "wordpress"
  }
}


# Security group for public subnet 
resource "aws_security_group" "public_sg" {
  name   = "${var.env}-Public-sg"
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.env}-Public-sg"
  }
}

# Security group traffic rules 
resource "aws_security_group_rule" "sg_ingress_public_22" {
  security_group_id = aws_security_group.public_sg.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "sg_egress_public" {
  security_group_id = aws_security_group.public_sg.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}