locals {
  network_name                   = "kubernetes-cluster-network"
  subnet_name                    = "nur-subnet"
  cluster_master_ip_cidr_range   = "10.100.100.0/28"
  cluster_pods_ip_cidr_range     = "10.101.0.0/16"
  cluster_services_ip_cidr_range = "10.103.0.0/16"
}


# locals {
#   public_subnet_cidr_ranges = {
#     "subnet-public-a" = "10.2.0.0/16"
#     "subnet-public-b" = "10.3.0.0/16"
#   }
# }

# locals {
#   private_subnet_cidr_ranges = {
#     "subnet-private-a" = "10.0.0.0/16"
#     "subnet-private-b" = "10.1.0.0/16"
#     "subnet-private-c" = "10.4.0.0/16"
#   }
# }

locals {
  owner = "nur"
}
