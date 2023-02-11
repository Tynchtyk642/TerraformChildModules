variable "prefix" {
  type        = string
  default     = "ant-tech"
  description = "prefix for all resources"
}


variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block specifying the IP range for the subnet."
}



variable "public_subnets" {
  type        = number
  description = "Variable defines count of public subnets"
  default     = 2
}

variable "public_cidrs" {
  type        = list(string)
  description = "Variable defines cidr range for public subnets"
}

variable "private_subnets" {
  type        = number
  description = "Variable defines count of private subnets"
  default     = 2
}

variable "private_cidrs" {
  type        = list(string)
  description = "Variable defines cidr range for private subnets"
}

variable "env_tag" {
  type        = string
  default     = "dev"
  description = "Tag for environment build"
}
