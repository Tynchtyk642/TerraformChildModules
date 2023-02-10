variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "env" {
  default = "dev"
  description = "System environment name"
}

variable "subnet_cidrs" {
  type = list(string)
  default = ["10.0.3.0/24"]
  description = "A list of subnet CIDR (Classless Inter-Domain Routing) blocks"
}
variable "private_subnet_cidrs" {
  default = [
    "10.0.11.0/24"
  ]
description = "A list of private subnet CIDR blocks"
}