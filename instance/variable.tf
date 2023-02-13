variable "subnet_id" {
  type    = list(string)
  default = []
}

variable "vpc-id" {}

variable "instance-type" {
  default = ""
  type = string
  description = "value"
}

variable "bastion-host-name" {
  default = ""
  type = string
  description = "value"
}

variable "env" {
  default = ""
  type = string
  description = "value"
}

variable "name-sg" {
  default = ""
  type = string
  description = "value"
}




