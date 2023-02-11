

resource "aws_instance" "ec2" {
  ami                         = var.ami
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.instance_sg.id]
  associate_public_ip_address = true


  tags = {
    Name = "${var.prefix}-instance"
  }
}



resource "aws_security_group" "instance_sg" {
  name   = "instance-security-group"
  vpc_id = var.sg_vpc_id

  dynamic "egress" {
    for_each = var.egress
    content {
      description = egress.value["description"]
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = egress.value["cidr_blocks"]
    }
  }

  dynamic "ingress" {
    for_each = var.ingress
    content {
      description = ingress.value["description"]
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  tags = {
    Name = "${var.prefix}-sg"
  }
}
