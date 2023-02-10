resource "google_sql_database_instance" "read_replica" {
  name                 = "replica-${random_id.db_name_suffix.hex}"
  master_instance_name = google_sql_database_instance.instance.name
  region               = "us-central1"
  database_version     = var.database_version
  deletion_protection  = var.deletion_protection
  replica_configuration {
    failover_target = false
  }

  settings {
    tier              = var.tier
    availability_type = "ZONAL"
    disk_size         = "100"
    backup_configuration {
      enabled = false
    }
    ip_configuration {
      ipv4_enabled    = var.ipv4_enabled
      private_network = var.network_name
    }
    location_preference {
      zone = "us-central1-a"
    }
  }
}