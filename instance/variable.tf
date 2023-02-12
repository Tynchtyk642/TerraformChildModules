variable "subnetwork" {
    description = "we leave it as a variable because we specify existing subnetwork on root module"
}
variable "network" {
    description = "we leave it as a variable because we specify existing network on root module"
}

variable "ins_depends_on" {
  type          = any 
  description   = "instance depends on public subnet"
}