output "master_instance_name" {
  value = google_sql_database_instance.instance
}

output "read_replica_name" {
  value = google_sql_database_instance.read_replica
}