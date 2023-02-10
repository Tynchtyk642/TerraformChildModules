resource "google_service_account" "default" {
  account_id   = "service-account-lunara"
  display_name = "Service Account"
}
data "google_container_engine_versions" "my-gke" {
  location = var.location
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.location
  network = var.network_name
  subnetwork = var.private_subnet
  min_master_version = data.google_container_engine_versions.my-gke.latest_master_version

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count       = 1
}

resource "google_container_node_pool" "node_pools" { 
  for_each = toset(local.node_pool_names) 
 
  name   = each.value 
  location   = local.location[each.value]
  cluster    = google_container_cluster.primary.name 
  node_count = local.node_counts[each.value] != "" ? local.node_counts[each.value] : "1"
 
  node_config { 
    preemptible  = var.preemptible
    machine_type = local.machine_types[each.value] 
 
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles. 
    service_account = google_service_account.default.email 
    oauth_scopes    = var.oauth_scopes
  } 
}
