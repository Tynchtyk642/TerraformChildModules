variable "prefix" {
  description = "Defines prefix for all resources"
  type        = string
  default     = "your_prefix"
}
variable "ami" {
  type        = string
  description = "Variable defines the ami of instance, region dependent"
}

variable "subnet_id" {
  type        = string
  description = "Variable defines the subnet of instance"
}

variable "sg_vpc_id" {
  type        = string
  description = "Variable defines the vpc of sg"
}

variable "key_name" {
  description = "Variable defines the key name of instance"
  type        = string
  default     = "mykey"
}

# variable "pub_key" {
#   description = "Variable defines pub-key, you have to put your pub_key value"
# }

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Variable defines the instance_type of instance(t2.micro, t2.large...)"
}

variable "ingress" {

  description = "sg ingress rules"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [{
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh allow"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }]
}


variable "egress" {

  description = "sg egress rules"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  default = [{
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow access to the Internet"
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }]
}

