variable "subnets" {
  type        = map(object({
    subnet_name = string
    cidr_block = string 
    region = string 
    private_ip_google_access = bool
  }))
  description = "It will create a subnet for each region"
  default = {
   }
}

variable "region" {
  type    = string
  default = "us-west1"
  description = "The GCP region for this subnetwork."
}

variable "source_ranges" {
  type= list
  default = []
  description = "If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges."
}

variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  default     = false
}

variable "network_name" {
  description = "The name of the network being created"
  type        = string
  default     = "lunaras-network"
}

variable "private_ip_google_access" {
  type    = bool
  default = true
  description = "When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access."

}

variable "purpose" {
  type = string 
  description = "The purpose of the resource."
  default = "VPC_PEERING"
}

variable "address_type" {
  type = string 
  description = "INTERNAL indicates internal IP ranges belonging to some network."
  default = "INTERNAL"
}

variable "private_ip_name" {
  type = string 
  description = "This argument specifies the name of the global address resource."
  default = "private-ip-address"
}

variable "nat_ip_allocate_option" {
  type = string 
  description = "How external IPs should be allocated for this NAT."
  default = "AUTO_ONLY"
}

variable "source_subnetwork_ip_ranges_to_nat" {
  type = string 
  description = "How NAT should be configured per Subnetwork."
  default = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

variable "router_name" {
  type = string 
  description = "Name of the router that will be created."
  default = "my-router"
}

variable "nat_name" {
  type = string 
  description = "Name of the NAT Service"
  default = "my-router-nat-lunara"
}

variable "firewall_name" {
  type = string 
  description = "This is the name of the firewall that will be created."
  default = "firewall-rule-ssh"
}
