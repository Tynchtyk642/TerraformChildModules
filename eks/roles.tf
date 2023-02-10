//✎﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏𝐂𝐑𝐄𝐀𝐓𝐄 𝐑𝐎𝐋𝐄 𝐅𝐎𝐑 𝐄𝐊𝐒 𝐂𝐋𝐔𝐒𝐓𝐄𝐑﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
resource "aws_iam_role" "EKSClusterRole" {
    name = "EKSClusterRole"

    assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}
//✎﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏𝐀𝐓𝐓𝐀𝐂𝐇 𝐏𝐎𝐋𝐈𝐂𝐈𝐄𝐒 𝐓𝐎 𝐄𝐊𝐒 𝐂𝐋𝐔𝐒𝐓𝐄𝐑 𝐑𝐎𝐋𝐄﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role       = aws_iam_role.EKSClusterRole.name
}
resource "aws_iam_role_policy_attachment" "AmazonEKSVPCResourceController" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
    role       = aws_iam_role.EKSClusterRole.name
}

//✎﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏𝐂𝐑𝐄𝐀𝐓𝐄 𝐑𝐎𝐋𝐄 𝐅𝐎𝐑 𝐓𝐇𝐄 𝐍𝐎𝐃𝐄 𝐆𝐑𝐎𝐔𝐏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
resource "aws_iam_role" "NodeGroupRole" {
    name = "eks-node-group-example22"

  assume_role_policy = jsonencode({
        Statement = [{
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
            Service = "ec2.amazonaws.com"
            }
            }]
    Version = "2012-10-17"
  })
}
//✎﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏𝐀𝐓𝐓𝐀𝐂𝐇 𝐏𝐎𝐋𝐈𝐄𝐂𝐈𝐄𝐒 𝐓𝐎 𝐍𝐎𝐃𝐄 𝐆𝐑𝐎𝐔𝐏 𝐑𝐎𝐋𝐄﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
resource "aws_iam_role_policy_attachment" "AmazonEKSWorkerNodePolicy" {
        policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
        role       = aws_iam_role.NodeGroupRole.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKS_CNI_Policy" {
        policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
        role       = aws_iam_role.NodeGroupRole.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly" {
        policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
        role       = aws_iam_role.NodeGroupRole.name
}