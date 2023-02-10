resource "google_compute_subnetwork" "subnets" {
  for_each      = var.subnets
  name          = each.value.subnet_name
  ip_cidr_range = each.value.cidr_block
  region        = each.value.region
  private_ip_google_access = lookup(each.value, "private_ip_google_access", false)
  network       = google_compute_network.custom-test.id
}