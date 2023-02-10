variable "network_name" {
  type        = string
  description = "The name of the virtual network that the instance should be connected to."
  default     = ""
}

variable "region" {
  type        = string
  description = "The region where the instance should be deployed."
  default     = "us-east1"
}

variable "database_version" {
  type        = string
  description = "SQL Server version to use"
  default     = "SQLSERVER_2019_ENTERPRISE"
}

variable "tier" {
  type        = string
  default     = "db-custom-12-61440"
  description = "The machine type to use"
}

variable "ipv4_enabled" {
  type        = bool
  description = "Cloud SQL instance should be assigned a public IPV4 address"
  default     = false
}

variable "deletion_protection" {
  type        = bool
  description = "Whether or not to allow Terraform to destroy the instance"
  default     = false
}

variable "disk_size" {
  type = string
  description = "The size of data disk, in GB"
  default = "100"
}

variable "read_replicas" { 
  description = "The variable is defined as a map, which allows it to store multiple read replicas and their respective information."
  type = map(object({
  region = string 
  zone = string 
  }))
  default = {
  replica1 = { 
      region      = "us-central1", 
      zone        = "us-central1-a", 
    }
  replica2 = { 
      region      = "europe-west1", 
      zone        = "europe-west1-b", 
    } 
} 
}

variable "failover_target" {
  type = bool
  description = "Specifies if the replica is the failover target."
  default = false
}
variable "backup_config" {
  type = bool
  description = "For all instances, ensure that settings.backup_configuration.enabled is set to false."
  default = false
}

variable "availability_type" {
  type = string
  description = "The availability type of the Cloud SQL instance, high availability (REGIONAL) or single zone (ZONAL)."
  default = "ZONAL"
}