//✎﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏𝐎𝐔𝐓𝐏𝐔𝐓𝐒 𝐎𝐅 𝐓𝐇𝐄 𝐄𝐊𝐒﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
output "endpoint" {
    value = aws_eks_cluster.cluster.endpoint
    description = "Endpoint for your Kubernetes API server"
    }

output "kubeconfig-certificate-authority-data" {
    value = aws_eks_cluster.cluster.certificate_authority[0].data
    description = "Base64 encoded certificate data required to communicate with your cluster."
    }