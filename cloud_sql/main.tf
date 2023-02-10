resource "google_sql_database_instance" "instance" {
  name                = "private-instance-${random_id.db_name_suffix.hex}"
  region              = var.region
  database_version    = var.database_version
  deletion_protection = var.deletion_protection
  #   depends_on = [google_service_networking_connection.private_vpc_connection]
  root_password = "zhakyp"

  settings {
    tier      = var.tier
    disk_size = var.disk_size
    ip_configuration {
      ipv4_enabled    = var.ipv4_enabled
      private_network = var.network_name
    }
  }
}

resource "random_id" "db_name_suffix" {
  byte_length = 4
}