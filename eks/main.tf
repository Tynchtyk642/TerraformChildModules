
#==========================Elastic Kubernetes Service Cluster===============================

resource "aws_eks_cluster" "cluster" {
  name     = var.cluster-name
  role_arn = aws_iam_role.cluster-role.arn

  vpc_config {
    subnet_ids              = var.private-subnet-ids
    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
  ]
  tags = { name = "${var.cluster-name}"
  environment = "${var.env}" }
}

#==========================Elastic Kubernetes Service Node Group ===============================

resource "aws_eks_node_group" "node" {
  for_each        = local.node_group
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = each.value
  node_role_arn   = aws_iam_role.node-role.arn
  subnet_ids      = var.private-subnet-ids
  scaling_config {
    desired_size = var.env == "dev" ? 1 : 2
    max_size     = var.env == "prod" ? 4 : 3
    min_size     = var.env == "stage" ? 2 : 1
  }

  update_config {
    max_unavailable = 1
  }

  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }

  ami_type      = "AL2_x86_64"
  capacity_type = "ON_DEMAND"


  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
  tags = {
  environment = "${var.env}" }
}

#==========================Elastic Kubernetes Service Template===============================

resource "aws_launch_template" "template" {
  name          = var.template-name
  instance_type = var.type == "t3.micro" ? "t3.micro" : "t3.micro"
  tags = { name = "${var.template-name}"
  environment = "${var.env}" }

}



