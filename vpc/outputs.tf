output "subnets" {
  description = "This Terraform output generates a map of key-value pairs, where the key is the name of a subnetwork and the value is the corresponding subnetwork ID."
  value = { for k , i in google_compute_subnetwork.subnets : k => i.id}  
}

output "vpc" {
  description = "This Terraform output provides the ID of a custom Google Compute Network."
  value = google_compute_network.custom-test.id
}

output "private_vpc_connection" {
  description = "This Terraform output provides the connection resource of a private VPC"
  value = google_service_networking_connection.private_vpc_connection
}