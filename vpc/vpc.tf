 resource "google_compute_network" "custom-test" {
  name                    = var.network_name
  auto_create_subnetworks = var.auto_create_subnetworks
}

## Private ip address
resource "google_compute_global_address" "private_ip_address" {
  name          = var.private_ip_name
  purpose       = var.purpose
  address_type  = var.address_type
  prefix_length = 16
  network       = google_compute_network.custom-test.id
}

## Private vpc connection
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.custom-test.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}