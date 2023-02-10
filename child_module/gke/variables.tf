variable "name" {
  type = string
  default = "aktan"
}

variable "region" {
  type        = string
  description = "The region to host the cluster in (optional if zonal cluster / required if regional)"
  default     = null
}

variable "zones" {
  type        = list(string)
  description = "The zones to host the cluster in (optional if regional cluster / required if zonal)"
  default     = []
}

#------------------------CLUSTER---------------------#
variable "node_pools" {
  type = map
  default = {
    pools = {
        first-node-pool = {
            node_counts = 1
            machine_types = "e2-medium"
            node_pool_location = "us-west1"
        },
        first-node-pool = {
            node_counts = 1
            machine_types = "e2-medium"
            node_pool_location = "us-west1"
        }
    }
  }
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster (required)"
  default     = ""
}

variable "cluster_location" {
  type        = string
  description = "The location where the instance should be deployed."
  default     = "us-west1"
}

variable "network_name" {
  type        = string
  description = "The VPC network to host the cluster in (required)"
  default     = ""
}

variable "subnet_name" {
  type        = string
  description = "The subnetwork to host the cluster in (required)"
  default     = ""
}

#----------------ip_allocation_policy----------------#
variable "ip_range_pods" {
  type        = string
  description = "The range of IP addresses to be used for pods in the Kubernetes cluster."
}

variable "ip_range_services" {
  type        = string
  default     = ""
  description = "The range of IP addresses to be used for services in the Kubernetes cluster."
}
#------------master_authorized_networks_config--------#
variable "authorized_ipv4_cidr_block" {
  type        = string
  default     = null
  description = "The range of IPv4 addresses authorized to access the VPC."
}


#-------------private_cluster_config------------------#
variable "enable_private_endpoint" {
  type        = bool
  description = "(Beta) Whether the master's internal IP address is used as the cluster endpoint"
  default     = false
}

variable "enable_private_nodes" {
  type        = bool
  description = "(Beta) Whether nodes have internal IP addresses only"
  default     = false
}

variable "master_ipv4_cidr_block" {
  type        = string
  description = "The IPv4 network range for the master network."
}

#-------------------addons_config-----------------------#
variable "horizontal_pod_autoscaling" {
  type        = bool
  description = "Enable horizontal pod autoscaling addon"
  default     = true
}

#-------------------network_policy---------------------#
variable "network_policy" {
  type        = bool
  description = "Enable network policy addon"
  default     = false
}

#------------------------NODEPOOL---------------------#
#-----------------------autoscaling----------------------#
variable "min_node_count" {
  type        = number
  default     = 3
  description = "The minimum number of nodes in the auto-scaling group."
}

variable "max_node_count" {
  type        = number
  default     = 5
  description = "The maximum number of nodes in the auto-scaling group."
}
#-----------------------management----------------------#
variable "auto_repair" {
  type        = bool
  default     = true
  description = "Whether the instance should be automatically repaired."
}

variable "auto_upgrade" {
  type        = bool
  default     = true
  description = "Whether the nodes in the cluster should be automatically upgraded."
}

#-----------------------node_config----------------------#
variable "preemptible" {
  type        = bool
  description = "Whether the instance should be a preemptible instance."
  default     = true
}

variable "oauth_scopes" {
  type = list(string)
  default = [
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
    "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
    "https://www.googleapis.com/auth/cloud-platform",
  ]
  description = "The OAuth scopes associated with the instance."
}




