# EKS Cluster Security Group
resource "aws_security_group" "eks_cluster" {
  name        = "${var.env}-cluster-sg"
  description = "Cluster communication with worker nodes"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.env}-cluster-sg"
  }
}

resource "aws_security_group_rule" "cluster_inbound" {
  description       = "Allow worker nodes to communicate with the cluster API Server"
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.eks_cluster.id

  to_port     = 443
  type        = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "cluster_outbound" {
  description       = "Allow cluster API Server to communicate with the worker nodes"
  from_port         = 1024
  protocol          = "tcp"
  security_group_id = aws_security_group.eks_cluster.id

  to_port     = 65535
  type        = "egress"
  cidr_blocks = ["0.0.0.0/0"]
}