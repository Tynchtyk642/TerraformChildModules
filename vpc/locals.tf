locals {
  internet = "0.0.0.0/0"
  firewall_allow = [
    { protocol = "tcp", ports = ["80", "22"] },
    { protocol = "icmp" }
  ]
  cluster_master_ip_cidr_range   = "10.0.0.0/28"
  cluster_pods_ip_cidr_range     = "10.21.0.0/16"
  cluster_services_ip_cidr_range = "10.22.0.0/16"

  subnets = {
    for x in var.subnets :
    "${x.subnet_region}/${x.subnet_name}" => x
  }

}