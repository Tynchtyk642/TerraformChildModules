variable "sg-name" {
  default     = "terra"
  type        = string
  description = "Name of Security Group"
}

variable "vpc_id" {
  default     = ""
  type        = string
  description = "Indetification of VPC"
}

variable "cluster-name" {
  default     = "eks-cluster"
  description = "Name of EKS Cluster"

}

variable "node-name" {
  default     = ""
  description = "Name of EKS Node-Group"
  type        = string
}

variable "private-subnet-ids" {}

variable "template-name" {
  default     = "Terraform-template"
  type        = string
  description = "Name of Launch Instance Template"

}

locals {
  node_group = {

    node_group_name = "${var.env}node-group1"

  }
}

variable "type" {
  default     = "t3.micro"
  description = "Instance type of Template"
}

variable "env" {
  default     = ""
  type        = string
  description = "Name of Environment"

}

variable "name-sg" {
  default     = ""
  type        = string
  description = "Cluster communication with worker nodes"

}
