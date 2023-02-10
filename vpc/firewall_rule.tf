resource "google_compute_firewall" "default" {
  name    = var.firewall_name
  network = google_compute_network.custom-test.name


dynamic "allow" {
  for_each = local.firewall_allow
  content {
    protocol = allow.value["protocol"]
    ports    = lookup(allow.value, "ports", null)
  }
}
  source_ranges = var.source_ranges
}
