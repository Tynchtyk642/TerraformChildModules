
output "eks_name" {
  description = "EKS Cluster name."
  value       = aws_eks_cluster.cluster.id
}

output "eks_certificate_authority" {
  description = "Attribute block containing certificate-authority-data for your cluster."
  value       = aws_eks_cluster.cluster.certificate_authority.0.data
}

output "eks_endpoint" {
  description = "Endpoint for your Kubernetes API server."
  value       = aws_eks_cluster.cluster.endpoint
}

output "eks_arn" {
  description = "EKS arn."
  value       = aws_eks_cluster.cluster.arn
}
output "r-security" {
   description = "Security group"
  value = aws_security_group.r-security.id
}