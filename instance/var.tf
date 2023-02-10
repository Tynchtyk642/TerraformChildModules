variable "ami" {
  type        = string
  description = "AMI to use for the instance."
}
variable "bastion_sg" {
  type        = string
  description = "List of security group names to associate with"
}
variable "instance_type" {
  type        = string
  description = "Instance type to use for the instance"
}
variable "subnet_id" {
  type        = string
  description = "Instance type to use for the instance"
}
variable "project" {
  type = string
  description = "environment name"
}