

variable "region" {
  description = "The aws region. https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html"
  type        = string
  default     = "us-east-1"
}


variable "public_subnet" {
  description = "This gives us CIDR range for public_subnets"
  type = list
  default = ["10.0.1.0/24","10.0.11.0/24"]
  
}
variable "private_subnet" {
  description = "This gives us CIDR range for private_subnets"

  type = list
  default = ["10.0.2.0/24","10.0.22.0/24","10.0.44.0/24"]
  
}






variable "availability_zones_count" {
  description = "The number of AZs."
  type        = number
  default     = 2
}

variable "project" {
  description = "Name to be used on all the resources as identifier. e.g. Project name, Application name"
  # description = "Name of the project deployment."
  type = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_bits" {
  description = "The number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
  type        = number
  default     = 8
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "Project"     = "Final_project"
    "Environment" = "Development"
    "Owner"       = "Kylychbek"
  }
}

variable "environment" {
  type = string
  default = "Development"
  
}
  