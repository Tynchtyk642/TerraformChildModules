data "google_container_engine_versions" "central1b" {
  location = var.location
}

resource "google_service_account" "default" {
  account_id   = "service-account-id"
  display_name = "Service Account"
}

resource "google_container_cluster" "primary" {
  name                     = var.name
  location                 = var.location
  network                  = var.network_name
  subnetwork               = var.subnet_name
  min_master_version       = data.google_container_engine_versions.central1b.latest_master_version
  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.ip_range_pods
    services_ipv4_cidr_block = var.ip_range_services
  }

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
  maintenance_policy {
    daily_maintenance_window {
      start_time = "03:00"
    }
  }

  master_auth {
    # username = "zh"
    # password = "123"

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  dynamic "master_authorized_networks_config" {
    for_each = var.authorized_ipv4_cidr_block != null ? [var.authorized_ipv4_cidr_block] : []
    content {
      cidr_blocks {
        cidr_block   = master_authorized_networks_config.value
        display_name = "External Control Plane access"
      }
    }
  }

  private_cluster_config {
    enable_private_endpoint = var.enable_private_endpoint
    enable_private_nodes    = var.enable_private_nodes
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block

  }

  addons_config {
    network_policy_config {
      disabled = false
    }
    horizontal_pod_autoscaling {
      disabled = var.horizontal_pod_autoscaling
    }
  }

  network_policy {
    enabled = var.network_policy
  }

}


resource "google_container_node_pool" "node_pools" {
  for_each = toset(local.node_pool_names)

  name       = each.value
  location   = local.location[each.value]
  cluster    = google_container_cluster.primary.name
  node_count = local.node_counts[each.value]

  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }

  node_config {
    preemptible  = var.preemptible
    machine_type = local.machine_types[each.value]

    service_account = google_service_account.default.email
    oauth_scopes    = var.oauth_scopes

    shielded_instance_config {
      enable_secure_boot = true
    }

  }

  depends_on = [
    google_container_cluster.primary
  ]
}
