variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "(Optional) Instance type to use for the instance."
}
variable "public_subnet_ids" {
  type        = string
  default     = ""
  description = "shows subnets ids"
}
variable "vpc_id" {
  type        = string
  default     = ""
  description = " ID of the specific VPC to retrieve"
}
variable "env" {
  type        = string
  default     = ""
  description = "System environment name"
}
