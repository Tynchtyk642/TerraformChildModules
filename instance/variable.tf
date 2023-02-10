
variable "env" {
  description = "Environment name to create resource in."
  default = "env"
  type    = string
}


variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Bastion instance type"
}
variable "public_subnet" {
  type = string
  description = "Public Subnets"
}
variable "sg" {
  type        = string
  description = "Security group for Bastion"
} 