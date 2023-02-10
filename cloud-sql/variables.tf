variable "private_network" {
  type        = string
  default     = ""
  description = "The VPC network from which the Cloud SQL instance is accessible for private IP."
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "database_version" {
  type        = string
  description = "The MSSQL Server version to use."
  default     = "SQLSERVER_2019_ENTERPRISE"
}

variable "read_replicas" {
  type = map(object({
    region = string
    zone   = string
  }))
  description = "The variable is defined as a map, which allows it to store multiple read replicas and their respective information."
  default = {
  }
}

variable "tier" {
  type        = string
  description = "The machine type to use. "
  default     = "db-custom-12-61440"
}

variable "disk_size" {
  type        = number
  description = "The size of data disk, in GB."
  default     = "100"
}

variable "ipv4_enabled" {
  type        = bool
  description = "Whether this Cloud SQL instance should be assigned a public IPV4 address."
  default     = false
}

variable "password" {
  type        = string
  description = "Initial root password"
}

variable "deletion_protection" {
  type        = bool
  description = "Whether or not to allow Terraform to destroy the instance."
  default     = false
}

variable "failover_target" {
  type        = bool
  description = "Specifies if the replica is the failover target."
  default     = false
}

variable "backup_config" {
  type        = bool
  description = "For all instances, ensure that settings.backup_configuration.enabled is set to false."
  default     = false
}
