#========================== Elastic Kubernetes Service Cluster Role===============================

resource "aws_iam_role" "cluster-role" {
  name = "eks-cluster-example1"

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

#==========================Elastic Kubernetes Service Node Group Role ===============================

resource "aws_iam_role" "node-role" {
  name = "eks-node-group-example3"

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
