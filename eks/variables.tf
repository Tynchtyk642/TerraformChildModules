
variable "env" {
  type        = string
  default     = "Mintemir"
  description = "this gives names of environment"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
  description = "ID of the specific VPC to retrieve."
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "ID of the specific VPC to retrieve."
}


variable "privet_subnet_ids" {
  type = list(string)
  default = ["10.0.12.0/24"]
  description= "List of privet subnet IDs"
}


variable "ingress_ports" {
  type    = list(any)
  default = [0]
  
}

variable "egress_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]

}
variable "ingress_cidr" {
  type    = list(string)
  default = ["0.0.0.0/0"]

}

variable region {
  type        = string
  default     = "us-east-1"
  description = "provides details about a specific AWS region."
}









