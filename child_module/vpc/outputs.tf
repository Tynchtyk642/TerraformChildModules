output "network_name" {
  value       = google_compute_network.vpc_network.id
  description = "The name of the VPC being created"
}

# output "subnet" {
#   value = { for k, i in google_compute_subnetwork.subnets : k => i.id}
#   description = "value"
# }

output "subnet_name" {
  value = [for subnet in google_compute_subnetwork.private-test : subnet.name]
}

output "private_vpc_connection" {
  value       = google_service_networking_connection.private_vpc_connection
  description = "value"
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
  value = local.cluster_master_ip_cidr_range
}