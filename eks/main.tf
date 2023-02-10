
#==========final project child root============
#
# eks cluster with node groups and lauch template
#==============================================
#  Made by Mintemir Kurbanaliev . February 2023




#####


#====================eks cluster =================================================
resource "aws_eks_cluster" "final-cluster" {
  name     = "${var.env}-eks"
  role_arn = aws_iam_role.cluster_role.arn
  version  = "1.24"

  vpc_config {
    subnet_ids = var.privet_subnet_ids

    endpoint_private_access = true
    endpoint_public_access  = true
    public_access_cidrs     = ["0.0.0.0/0"]
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role_policy_attachment
  ]
}



#======================node-eks-node-group=========

resource "aws_eks_node_group" "final_node_group" {
  cluster_name    = aws_eks_cluster.final-cluster.name
  node_group_name = "${var.env}-node-group"
  node_role_arn   = aws_iam_role.node_group_role.arn
  subnet_ids      = var.privet_subnet_ids
  scaling_config {
    desired_size = 2
    max_size     = 5
    min_size     = 1
  }
  ami_type      = "AL2_x86_64" # AL2_x86_64, AL2_x86_64_GPU, AL2_ARM_64, CUSTOM
  capacity_type = "ON_DEMAND"  # ON_DEMAND, SPOT


  launch_template {
    id      = aws_launch_template.template.id
    version = aws_launch_template.template.latest_version
  }

  tags = {
    "kubernetes.io/cluster/eks" = "owned"
    Environment                 = "test"
  }
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
  ]

}