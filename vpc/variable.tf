variable "subnet-name" {
  type        = string
  description = "value"
  default     = "Provides an VPC subnet resource."
}

variable "private-subnet-name" {
  description = "Provides an VPC subnet resource."
  default     = {}

}

variable "subnets-cidr-block" {
  default = [
    "10.5.1.0/24",
    "10.5.2.0/24",
    "10.5.3.0/24",
  ]
}


variable "private-subnets-cidr-block" {
  default = [
    "10.5.4.0/24",
    "10.5.5.0/24",
    "10.5.6.0/24",
  ]
}

variable "subnet-id" {
  type        = list(string)
  default     = []
  description = "Identification of subnet"
}

variable "subnet_id" {
  type        = list(string)
  default     = []
  description = "Identification of subnet"
}

variable "private-subnet-id" {
  default     = []
  description = "Identification of subnet"
}

variable "vpc-cidr-block" {
  default     = "10.5.0.0/16"
  description = "Range for the subnet, in CIDR notation"
}

variable "name" {
  type        = string
  default     = ""
  description = "Name of Virtual Private Cloud"
}

variable "vpc_id" {
  default     = ""
  description = "Identification of VPC"
}

variable "namesg" {
  default     = "terraform"
  description = "Name of Security Group"

}

variable "env" {
  default     = ""
  description = "Name of Environment"
}
