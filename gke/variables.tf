variable "network_name" {
  type = string 
  description = "The name or self_link of the GCE network to which the cluster is connected."  
}

variable "private_subnet" {
  type = string 
  description = "The name or self_link of the GCE subnetwork in which the cluster's instances are launched."
}


variable "oauth_scopes" {
  type = list(string)
  description = "Scopes that are used by NAP and GKE Autopilot when creating node pools."
  default = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
      "https://www.googleapis.com/auth/cloud-platform",
  ]
}

variable "preemptible" {
  type = bool
  description = "Whether the instance should be a preemptible instance."
  default = true
}

variable "remove_default_node_pool" {
  type = bool
  default = true 
  description = "If true, deletes the default node pool upon cluster creation."
}

variable "location" {
  type = string 
  description = "The location in which the cluster master will be created, as well as the default node location."
  default = "us-east1"
}

variable "cluster_name" {
  type = string 
  description = "The cluster name"
  default = ""
}