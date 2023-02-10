
variable "env" {
  description = "Name to be used on all the resources as identifier. e.g. Environment name"
  type = string
  default = "env"
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
  type = string
  description = "The ID of the VPC"
}

variable "instance_type" {
  type = string
  description = "t2.micro"
  default = "t2.micro"
}