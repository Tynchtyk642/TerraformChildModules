resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.cluster.arn
  version  = var.cluster_version

  vpc_config {
    security_group_ids      = flatten([aws_security_group.cluster.id, aws_security_group.worker_group_mgmt.id])
    subnet_ids              = var.subnet_ids
    endpoint_private_access = false
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }

  depends_on = [
    aws_security_group.cluster,
    aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSServicePolicy,
    aws_iam_role_policy_attachment.cluster_AmazonEKSVPCResourceControllerPolicy
  ]

  lifecycle {
    create_before_destroy = false
    # ignore_changes = [
    #   vpc_config
    # ]
  }
  tags = {
    Name = "${var.cluster_name}"
  }
}

resource "aws_security_group" "cluster" {
  name_prefix = var.cluster_name
  description = "Cluster communication with worker nodes"
  vpc_id      = var.vpc_id

  dynamic "egress" {
    for_each = var.egress
    content {
      description = egress.value["description"]
      from_port = egress.value["from_port"]
      to_port = egress.value["to_port"]
      protocol = egress.value["protocol"]
      cidr_blocks = egress.value["cidr_blocks"]
    }
  }
  
  tags = {
    Name = "SG-${var.cluster_name}"
  }
}

# resource "aws_security_group_rule" "cluster_egress_internet" {
#   description       = "Allow cluster egress access to the Internet."
#   protocol          = "-1"
#   security_group_id = aws_security_group.cluster.id
#   cidr_blocks       = ["0.0.0.0/0"]
#   from_port         = 0
#   to_port           = 0
#   type              = "egress"
# }

# resource "aws_security_group_rule" "cluster_egress" {
#   description       = "Allow cluster ingress"
#   protocol          = "-1"
#   security_group_id = aws_security_group.cluster.id
#   cidr_blocks       = ["0.0.0.0/0"]
#   from_port         = 0
#   to_port           = 0
#   type              = "ingress"
# }



# resource "aws_security_group_rule" "node_ingress" {
#   description       = "Allow ingress"
#   protocol          = "-1"
#   security_group_id = aws_security_group.worker_group_mgmt.id
#   cidr_blocks       = ["0.0.0.0/0"]
#   from_port         = 0
#   to_port           = 0
#   type              = "ingress"
# }

# resource "aws_security_group_rule" "node_egress_internet" {
#   description       = "Allow node eress"
#   protocol          = "-1"
#   security_group_id = aws_security_group.worker_group_mgmt.id
#   cidr_blocks       = ["0.0.0.0/0"]
#   from_port         = 0
#   to_port           = 0
#   type              = "egress"
# }


resource "aws_iam_role" "cluster" {
  name = "${var.cluster_name}-iam"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "EKSClusterAssumeRole"
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster.name
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = aws_iam_role.cluster.name
}

resource "aws_iam_role_policy_attachment" "cluster_AmazonEKSVPCResourceControllerPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.cluster.name
}