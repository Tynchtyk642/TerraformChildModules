variable "user_data" {
  description = "File with userdata in it"
}
variable "env" {
  description = "Name to be used on all the resources as identifier. e.g. Environment name"
  type        = string
  default     = "nuriza"
}

variable "desired_size" {
  description = "Desired number of worker nodes."
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of worker nodes."
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}



variable "node_groups" {
}

locals {
  node_groups = {
    for x in var.node_groups :
    "${x.max_size}/${x.min_size}" => x
  }
}

variable "cidr_public" {
  type        = list(string)
  default     = ["10.0.0.0/24"]
  description = "List of CIDR blocks of public subnets."
}

variable "cidr_private" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "List of CIDR blocks of private subnets."
}

variable "private_ids" {
  type        = list(string)
  description = "The IDs of the private subnets"
}

variable "public_ids" {
  type        = list(string)
  description = "The IDs of the public subnets"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}

variable "instance_type" {
  type        = string
  description = "Instance type for instance"
  default     = "t2.micro"
}

