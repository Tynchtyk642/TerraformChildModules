resource "google_compute_subnetwork" "private-test" {
  for_each                 = local.subnets
  name                     = each.value.subnet_name
  ip_cidr_range            = each.value.subnet_ip_range
  region                   = each.value.subnet_region
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = lookup(each.value, "subnet_private_access", null)
}
