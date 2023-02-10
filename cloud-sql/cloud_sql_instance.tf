
## Random id
resource "random_id" "db_name_suffix" {
  byte_length = 4
}

## Database instance
resource "google_sql_database_instance" "instance" {
  name                = "private-instance-${random_id.db_name_suffix.hex}"
  region              = var.region != "" ? var.region : "us-east1"
  database_version    = var.database_version
  deletion_protection = var.deletion_protection
  root_password       = var.password

  settings {
    tier      = var.tier
    disk_size = var.disk_size
    ip_configuration {
      ipv4_enabled    = var.ipv4_enabled
      private_network = var.private_network
    }
  }
}