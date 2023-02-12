output "ip-address" {
    value       = google_compute_address.static
    description = "reserved ip of instance to ssh and connect to private sql"
}

output "instance-name" {
    value       = google_compute_instance.connect-instance
    description = "the name of instance"
}