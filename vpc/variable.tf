variable "public_subnet_cidrs" {
  description = "The  CIDR block for the VPC. "
  default = [
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}
variable "env" {
  description = "Environment name to create resource in."
  default = "env"
  type    = string
}
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  default = "10.0.0.0/16"
  type    = string
}
variable "private_subnet_cidrs" {
  description = "The  CIDR block for the VPC. "
  default = [
    "10.0.11.0/24",
    "10.0.12.0/24",
    "10.0.13.0/24"
  ]
}
