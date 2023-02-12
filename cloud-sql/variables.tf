// db variables

variable "db_depends_on" {
  description = "A single resource that the database instance depends on"
  type        = any
}

variable "network_name" {
  description = "A link to the VPC where the db will live (i.e. google_compute_network.some_vpc.self_link)"
  type        = string
}

variable "sql_name" {
  default     = "nurda-mssql-private-instance"
  type        = string
  description = "SQL private instance's name"
}

variable "sql_password" {
  type        = string
  description = "root password can be set"
  default     = "password"
}

variable "sql_region" {
  type        = string
  description = "region where sql private instance will be created"
}

variable "sql_version" {
  default     = "SQLSERVER_2019_ENTERPRISE"
  description = "Only 'SQLSERVER_2019_ENTERPRISE' version can be used in order to cerate Read-Replica"
  type        = string
}

variable "deletion_protection" {
  type        = bool
  default     = false
  description = "deletion policy if needed"
}
variable "sql_tier" {
  default     = "db-custom-32-122880"
  description = "Instance might be changed depending on demand"
  type        = string
}

variable "sql_disk_size" {
  default     = "100"
  type        = number
  description = "size on disk depending on demand"
}
variable "ipv4_enabled" {
  default     = false
  type        = bool
}

variable "read_replica_name" {
  default     = "read-replica-for-master"
  type        = string
  description = "Name for read replica"
}

variable "zone" {
  description = "zone for read replica"
  type        = string
}