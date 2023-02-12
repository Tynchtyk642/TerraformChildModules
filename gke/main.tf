#cluster

# data "google_container_engine_versions" "available" {
#   location = var.location
# }

resource "google_container_cluster" "app_cluster" {
  name                       = var.cluster_name
  location                   = var.region
  min_master_version =    "1.21.14-gke.14100"
  #  min_master_version         = data.google_container_engine_versions.available.latest_master_version
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool   = true
  initial_node_count         = 1

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.pods_ipv4_cidr_block
    services_ipv4_cidr_block = var.services_ipv4_cidr_block
  }
  network                    = var.network
  subnetwork                 = var.subnet_name

  logging_service            = "logging.googleapis.com/kubernetes"
  monitoring_service         = "monitoring.googleapis.com/kubernetes"
  maintenance_policy {
    daily_maintenance_window {
      start_time             = "02:00"
    }
  }



  dynamic "master_authorized_networks_config" {
    for_each = var.authorized_ipv4_cidr_block != null ? [var.authorized_ipv4_cidr_block] : []
    content {
      cidr_blocks {
        cidr_block           = master_authorized_networks_config.value
        display_name         = "External Control Plane access"
      }
    }
  }

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  release_channel {
    channel                 = "STABLE"
  }

  addons_config {
    // Enable network policy (Calico)
    network_policy_config {
      disabled              = false
    }
  }

  /* Enable network policy configurations (like Calico).
  For some reason this has to be in here twice. */
  network_policy {
    enabled                 = "true"
  }
depends_on                  = [var.depends_on_subnetwork]
}


# NODE POOL PART
resource "google_container_node_pool" "container_node_pool" {
  name                       = var.node_pool_name
  location                   = google_container_cluster.app_cluster.location
  node_locations             = var.node_zones
  cluster                    = google_container_cluster.app_cluster.name
  node_count                 = 1

  autoscaling {
    max_node_count           = 1
    min_node_count           = 1
  }
  max_pods_per_node          = 100

  management {
    auto_repair              = true
    auto_upgrade             = true
  }

  node_config {
    preemptible              = true
    disk_size_gb             = 10
    machine_type             = var.machine_type
    service_account          = ""
    oauth_scopes             = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
    ]

    labels = {
      cluster = google_container_cluster.app_cluster.name
    }

    shielded_instance_config {
      enable_secure_boot    = true
    }
  }
}
