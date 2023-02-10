locals {
  node_groups = {
     for x in var.node_groups :
    "${x.max_size}/${x.min_size}" => x
  }
}

//----------------------------------  EKS Node Group ----------------------------
resource "aws_eks_node_group" "roza" {
  for_each        = local.node_groups
  node_group_name = "${var.env}-${each.value.node_group_name}"

  cluster_name  = aws_eks_cluster.cluster.name
  node_role_arn = aws_iam_role.eks_node.arn
  subnet_ids    = var.subnet
#   ami_type      = var.ami_id != "" ? null : var.ami_type

  scaling_config {
    desired_size = each.value.desired_size
    max_size     = each.value.max_size
    min_size     = each.value.min_size
  }
  launch_template {

    id      = aws_launch_template.templete.id
    version = "$Latest"
  }
   ami_type       = each.value.ami_type
   disk_size = lookup(each.value, "disk_size", null)

  tags = {
    Name = "${var.env}-${each.value.node_group_name}"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_node,
    aws_iam_role_policy_attachment.eks_node_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_node_AmazonEKS_CNI_Policy
  ]

}


//---------------------------------- EKS Node Group Role --------------------------------
resource "aws_iam_role" "eks_node" {
  name = "${var.env}-eks-node"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}



resource "aws_iam_role_policy_attachment" "eks_node_AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_node.name
}

resource "aws_iam_role_policy_attachment" "eks_node_AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_node.name
}

resource "aws_iam_role_policy_attachment" "eks_node" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_node.name
}

//LAUNCH_TEMPLATE
resource "aws_launch_template" "templete" {
  name          = "${var.env}roza-template"
  instance_type = var.instance_type
#   image_id      = var.ami_id
  network_interfaces {
    device_index                = 0
    associate_public_ip_address = true
    security_groups             = ["${aws_security_group.r-security.id}"]
  }
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.env}-roza-instance"
    }
  }


}