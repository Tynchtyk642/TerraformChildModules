resource "google_sql_database_instance" "read_replica" {
  for_each             = var.read_replicas
  name                 = "${each.key}-${random_id.db_name_suffix.hex}"
  master_instance_name = google_sql_database_instance.instance.name
  region               = each.value.region
  database_version     = var.database_version
  deletion_protection  = var.deletion_protection
  replica_configuration {
    failover_target = var.failover_target
  }

  settings {
    tier              = var.tier
    availability_type = "ZONAL"
    disk_size         = var.disk_size
    backup_configuration {
      enabled = var.backup_config
    }
    ip_configuration {
      ipv4_enabled    = var.ipv4_enabled
      private_network = var.private_network
    }
    location_preference {
      zone = each.value.zone
    }
  }
}