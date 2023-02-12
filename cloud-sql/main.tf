
#Database instance
resource "google_sql_database_instance" "instance" {
  name                 = var.sql_name
  region               = var.sql_region
  database_version     = var.sql_version
  root_password        = var.sql_password ## can be set!!
  deletion_protection  = var.deletion_protection
  depends_on           = [var.db_depends_on]
  
  settings {
    tier = var.sql_tier
    disk_size          = var.sql_disk_size
    ip_configuration {
      ipv4_enabled     = var.ipv4_enabled
      private_network  = var.network_name
    }
  }
}

#read-replica
resource "google_sql_database_instance" "read_replica" {
  name                 = var.read_replica_name
  master_instance_name = "${google_sql_database_instance.instance.name}"
  region               = var.sql_region
  database_version     = var.sql_version
  deletion_protection  = var.deletion_protection
  replica_configuration {
    failover_target    = false
  }

  settings {
    tier               = var.sql_tier
    availability_type  = "ZONAL"
    disk_size          = var.sql_disk_size
    backup_configuration {
      enabled          = false
    }
    ip_configuration {
      ipv4_enabled     = true
      private_network  = var.network_name
    }
    location_preference {
      zone             = var.zone
    }
  }
}