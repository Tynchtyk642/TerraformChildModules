
variable "env" {
  description = "Environment name to create resource in."
  type        = string
}

variable "node_groups" {
  description = "Cluster Node Group"
  type    = any
  default = {}
}

variable "cluster_version" {
  description = "EKS Cluster version."
  type = string
}
variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}
variable "vpc" {
  type = string

}
variable "allow_ports" {
   description = "Configuration block for ingress rules "
  type    = list(any)
  default = ["0"]
}

variable "ami_type" {
  description = "Type of Amazon Machine Image (AMI) associated with the EKS Node Group. Valid values are `AL2_x86_64`, `AL2_x86_64_GPU`, `AL2_ARM_64`, `CUSTOM`, `BOTTLEROCKET_ARM_64`, `BOTTLEROCKET_x86_64`"
  type        = string
  default     = null
}

variable "subnet" {
  type = list(string)
}
# variable "ami_id" {
#   description = "The AMI from which to launch the instance. If not supplied, EKS will use its own default image"
#   type        = string
#   default     = ""
# }
variable "instance_type" {
  type    = string
  default = "t2.micro"

}