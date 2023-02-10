//✎﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏𝐂𝐑𝐄𝐀𝐓𝐄 𝐄𝐊𝐒 𝐂𝐋𝐔𝐒𝐓𝐄𝐑﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
resource "aws_eks_cluster" "cluster" {
    version  = "1.24"
    name     = "${var.env}-eks"
    role_arn = aws_iam_role.EKSClusterRole.arn
  

  vpc_config {
        endpoint_private_access = true
        endpoint_public_access = true
        public_access_cidrs = ["0.0.0.0/0"]
        security_group_ids = [aws_security_group.js-sg-node.id]
        subnet_ids = var.private_subnet_id
    
      }

 
      depends_on = [
        aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
        aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
      ]
}
//✎﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏𝐂𝐑𝐄𝐀𝐓𝐄 𝐄𝐊𝐒 𝐍𝐎𝐃𝐄 𝐆𝐑𝐎𝐔𝐏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
resource "aws_eks_node_group" "node-gr-js" {
    for_each = local.node_group
    cluster_name    = aws_eks_cluster.cluster.name
    node_group_name = each.value
    node_role_arn   = aws_iam_role.NodeGroupRole.arn
    subnet_ids      = var.private_subnet_id

  scaling_config {
      desired_size   = var.env == "prod" ? 3 : 2
      max_size       = var.env == "prod" ? max(3,0,1) : 3
      min_size       = var.env == "prod" ? min(12, 54, 3) : 1
      }

  update_config {
      max_unavailable = 1
  }
  launch_template {
      id = aws_launch_template.templ.id
      version = "$Latest"
     }

     ami_type       = "AL2_x86_64" # AL2_x86_64, AL2_x86_64_GPU, AL2_ARM_64, CUSTOM
      capacity_type  = "ON_DEMAND"  # ON_DEMAND, SPOT

  
      depends_on = [
        aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
        aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
        aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
        ]
}

//✎﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏𝐂𝐑𝐄𝐀𝐓𝐄 𝐋𝐀𝐔𝐍𝐂𝐇 𝐓𝐄𝐌𝐏𝐋𝐀𝐓𝐄﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
resource "aws_launch_template" "templ" {
      name = "${var.env}-jaks-templ"
      instance_type = var.env == "dev" ? lookup(var.instance_type, "dev") : lookup(var.instance_type, "stage")

  network_interfaces {
      associate_public_ip_address = false
      security_groups = ["${aws_security_group.for_launch-sg.id}"] 
  }
  tag_specifications {
      resource_type = "instance"


    tags = {
        Name = "${var.env}-instance"
        environment = "${var.env}"
      }
    }
  
}

data "aws_ami" "ubuntu" {
    most_recent      = true
    owners           = ["704109570831"]
  }

