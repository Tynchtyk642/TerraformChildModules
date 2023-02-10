output "cluster_name" {
  value = aws_eks_cluster.this.name
  description = "eks_cluster name"
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
  description = "eks_cluster endpoint"
}

output "cluster_ca_certificate" {
  value = aws_eks_cluster.this.certificate_authority[0].data
  description = "eks_cluster"
}