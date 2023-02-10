#----------------database_instance------------------#
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

variable "deletion_protection" {
  type        = bool
  description = "Whether or not to allow Terraform to destroy the instance"
  default     = false
}

#--------------------------settings-----------------------#
variable "tier" {
  type        = string
  default     = "db-custom-12-61440"
  description = "The machine type to use"
}

#----------------settings>>ip_configuration---------------#
variable "ipv4_enabled" {
  type        = bool
  description = "Cloud SQL instance should be assigned a public IPV4 address"
  default     = false
}


variable "network_name" {
  type        = string
  description = "The name of the virtual network that the instance should be connected to."
  default     = ""
}