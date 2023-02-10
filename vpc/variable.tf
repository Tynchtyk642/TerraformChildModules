

variable "subnet_cidr_bits" {
  description = "The number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
  type        = number
  default     = 8
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/16"
}

variable "env" {
  description = "Name to be used on all the resources as identifier. e.g. Environment name"
  type        = string
  default     = "env"
}

variable "public_subnets_count" {
  description = "The number of public subnets."
  type        = number
  default     = 2
}

variable "private_subnets_count" {
  type        = number
  default     = 2
  description = "The number of private subnets."
}