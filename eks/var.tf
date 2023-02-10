variable "private_subnets" {
  type        = list(any)
  description = "ID of subnets in which will be created cluster and node group"
}
variable "project" {
  type        = string
  description = "Name to be used on all the resources as identifier. e.g. Project name, Application name"
  default     = "project"
}
variable "vpc_id" {
  type        = string
  description = "ID of vpc in which will be created cluster"
}
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "Project"     = "Final Project"
  }
}
variable "node_groups" {
  type        = map(any)
  description = "map which contains node_group name desired_capacity, max_size and min_size"
}

locals {
  node_groups = {
    for x in var.node_groups :
    "${x.max_size}/${x.min_size}" => x
  }
}
