
output "endpoint" {
  value       = aws_eks_cluster.cluster.endpoint
  description = "Endpoint of Cluster"
}

output "kubeconfig-certificate-authority-data" {
  value       = aws_eks_cluster.cluster.certificate_authority[0].data
  description = "Output of Kuberconfig Certificate Authority Data"
}
