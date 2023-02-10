variable "env" {
  description = "Name to be used on all the resources as identifier. e.g. Environment name"
  type        = string
  default     = "env"
}

variable "public_ids" {
  type        = list(string)
  description = "The IDs of the public subnets"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC"
}