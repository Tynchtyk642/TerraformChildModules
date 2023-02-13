resource "aws_instance" "BASTION" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance-type
  subnet_id              = var.subnet_id[0]
  vpc_security_group_ids = [aws_security_group.only_ssh_bositon.id]



  tags = {
    Name        = "${var.bastion-host-name}"
    environment = "${var.env}"
  }

}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["602401143452"]
  tags        = { environment = "${var.env}" }
}


resource "aws_security_group" "only_ssh_bositon" {
  depends_on = [var.subnet_id]
  name       = var.name-sg
  vpc_id     = var.vpc-id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name        = "${var.name-sg}"
    environment = "${var.env}"
  }
}
