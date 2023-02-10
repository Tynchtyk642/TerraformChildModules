output "cluster_name" {
  description = "Name of the IAM role that provides permissions for the Kubernetes control plane"

  value = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  description = "Endpoint of the IAM role that provides permissions for the Kubernetes control plane"

  value = aws_eks_cluster.this.endpoint
}

output "cluster_ca_certificate" {
  description = "Data of the IAM role that provides permissions for the Kubernetes control plane"
  
  value = aws_eks_cluster.this.certificate_authority[0].data
}

