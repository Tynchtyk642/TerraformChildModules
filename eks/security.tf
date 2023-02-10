//------------------------------------ EKS Cluster's Security Group ------------------------
resource "aws_security_group" "cluster" {
  name_prefix = "${var.env}-${var.cluster_name}"
  vpc_id      = var.vpc

  tags = {
    Name = "SGr-${var.cluster_name}"
  }
}

resource "aws_security_group_rule" "cluster_egress" {
  protocol          = "-1"
  security_group_id = aws_security_group.cluster.id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  to_port           = 0
  type              = "egress"
}
resource "aws_security_group" "r-security" {
  name   = "${var.env}-r-security"
  vpc_id = var.vpc

  dynamic "ingress" {
    for_each = var.allow_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
resource "aws_security_group" "w-sg" {
  name_prefix = "${var.env}-w-sg"
  vpc_id      = var.vpc

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}
