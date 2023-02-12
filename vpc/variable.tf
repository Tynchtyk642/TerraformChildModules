variable "project_id" {
  type = string
  description = "The project ID to host the network in"
}

variable "region" {
  type = string
  description = "The region to use"
}


#Variables for VPC
variable "auto_create_subnetworks" {
  description = "It will create a subnet for each region automatically across the across CIDR-block range, if it is <true> "
  type = bool
  default = false
}

variable "routing_mode" {
  description = "The network routing mode"
  type    = string
  default = "GLOBAL"
}

variable "delete_default_routes_on_create" {
  type    = bool
  default = true
}

#Variabels for nat router
variable "nat_ip_allocate_option" {
  description = " for nat router"
  default = "AUTO_ONLY"
}

variable "source_subnetwork_ip_ranges_to_nat" {
  description = "To use for exact subnets"
  default = "LIST_OF_SUBNETWORKS"
}

variable "subnet_count" {
  default = 5
}

variable "public_subnet_count" {
  default = 2
}

variable "public_subnet_cidr_ranges" {
  type = list(string)
   default = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "private_subnet_cidr_ranges" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]

}