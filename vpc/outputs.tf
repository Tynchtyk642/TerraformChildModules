output "network_name" {
  value       = google_compute_network.vpc_network.id
  description = "This Terraform output provides the ID of a custom Google Compute Network."
}

output "subnet_name" {
  value       = [for subnet in google_compute_subnetwork.private-test : subnet.name]
  description = "This Terraform output generates a map of key-value pairs, where the key is the name of a subnetwork and the value is the corresponding subnetwork ID."
}

output "private_vpc_connection" {
  value       = google_service_networking_connection.private_vpc_connection
  description = "This Terraform output provides the connection resource of a private VPC"
}

output "cluster_pods_ip_cidr_range" {
  value       = local.cluster_pods_ip_cidr_range
  description = "The CIDR range to use for Kubernetes cluster pods"
}


output "cluster_services_ip_cidr_range" {
  value       = local.cluster_services_ip_cidr_range
  description = "The CIDR range to user for Kubernetes cluster services"
}

output "cluster_master_ip_cidr_range" {
  value       = local.cluster_master_ip_cidr_range
  description = "This output can be used to retrieve the IP address range for the cluster master in the desired network"
}