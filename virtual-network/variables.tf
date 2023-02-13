variable "subscription_id" {
  description = "Deployment subscription target."
  type        = string
}

variable "prefix_name" {
  description = "The prefix name of the environment resources being deployed. e.g. eisarch-env-loc"
  type        = string
  default = "kubat"
}

variable "unique" {
  description = "The input variable used to add uniqueness where required."
  type        = string
}

variable "vnet_address_space" {
  type = list(string)
  default = ["10.42.0.0/16"]
  description = "A list of address spaces, mapped to subnet use."
}

variable "location" {
    type        = string
    description = "Target region name for deployment"
}

variable "tags_list" { 
    type        = map(string)
    description = "A list of tags to be applied to, or combined with other tags on resources."
}