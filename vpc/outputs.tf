output "network" {
  value       = google_compute_network.vpc.id
  description = "The VPC will be used for other modules"
}

#===========================OUTPUTS FOR GKE ===============================#
output "private_subnet" {
  value = google_compute_subnetwork.subnet[var.public_subnet_count]
}

output "first_private_subnet_private_google_ip_access" {
  value = google_compute_subnetwork.subnet[var.public_subnet_count].private_ip_google_access
}

output "public_subnet" {
  value = google_compute_subnetwork.subnet[1]
}

# output "private_subnet" {
#   value       = google_compute_subnetwork.private-subnet["subnet-private-a"]
#   description = "The private subnet will be used for other modules"
# }
# output "public_subnet" {
#   value       = google_compute_subnetwork.public-subnet["subnet-public-a"]
#   description = "The private subnet will be used for other modules"
# }
output "cluster_master_ip_cidr_range" {
  value       = local.cluster_master_ip_cidr_range
  description = "The CIDR range to use for Kubernetes cluster master"
}

output "cluster_pods_ip_cidr_range" {
  value       = local.cluster_pods_ip_cidr_range
  description = "The CIDR range to use for Kubernetes cluster pods"
}

output "cluster_services_ip_cidr_range" {
  value       = local.cluster_services_ip_cidr_range
  description = "The CIDR range to use for Kubernetes cluster services"
}

#========================OUTPUTS FOR SQL===========================#
output "private_vpc_connection" {
  value = google_service_networking_connection.private_vpc_connection
  description = "will be used for sql"
}

output "private_ip_block" {
  value = google_compute_global_address.private_ip_block
  description = "will be used for sql"
}
output "google_service_networking_connection" {
  value = google_service_networking_connection.private_vpc_connection
  description = "will be used for sql"
}