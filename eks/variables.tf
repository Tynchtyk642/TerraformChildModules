variable "node_groups" {
  description = "Variables defines scaling config values"
  type        = map(map(number))

  default = {
    node_group = {
      desired_size = 2
      max_size     = 4
      min_size     = 1
    }


  }
}

variable "ingress" {

  description = "Variable defines sg ingress rules"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [{
    cidr_blocks = ["0.0.0.0/0"]
    description = "value"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }]
}

variable "egress" {

  description = "Varaible defines sg egress rules"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [{
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow cluster egress access to the Internet."
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }]
}


variable "prefix" {
  type        = string
  description = "VAriable defines the prefix for all your resources"
}


variable "cluster_name" {
  description = "Variable defines the EKS Cluster name"
  type        = string
  default     = "eks-aws-ter"
}

variable "cluster_version" {
  description = "Variable defines the EKS Cluster version."
  type        = string
  default     = "1.24"
}

variable "subnet_ids" {
  description = "Variables defines subnet id of eks"
  type        = list(string)
}


variable "vpc_id" {
  type        = string
  description = "Variable defines vpc_id"
}



variable "instance_type" {
  description = "Variable defines the instance_type for launche template"
  default     = "t3.micro"
}

variable "key_name" {
  description = "key name for instances, for accessing (ssh and etc...)"
  type        = string
}


