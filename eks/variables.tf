variable "env" {
   type = string
    default = "dev"
    description = "specified resources enviroment"
  
}
variable "ingress" {
   default = ["0"]
   description = "specified multiple times for each ingress rule"
}
variable "instance_type" {
   default = {
      "dev" = "t1.micro"
      "stage" = "t2.micro"
      "prod" = "t2.nano"
      description = "use for the instance"
   }
}
variable "vpc"{
      type = string
      default = ""
      description = "ID of the vpc"
}

variable "private_subnet_id" {
  description = "CIDR of the private subnets"
}

locals {
  node_group= {
    
    node_group_name = "${var.env}node-group1"
   
   }
}
