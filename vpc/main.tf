#vpc
resource "google_compute_network" "vpc" {
  name                            = local.network_name
  auto_create_subnetworks         = var.auto_create_subnetworks
  routing_mode                    = var.routing_mode
  delete_default_routes_on_create = var.delete_default_routes_on_create
  
}





# # private subnet 
# resource "google_compute_subnetwork" "private-subnet" {
#   for_each                 = local.private_subnet_cidr_ranges
#   name                     = each.key
#   ip_cidr_range            = each.value
#   network                  = google_compute_network.vpc.name
#   private_ip_google_access = true
# }

# #public subnet  private_ip_google_access is off
# resource "google_compute_subnetwork" "public-subnet" {
#   for_each                 = local.public_subnet_cidr_ranges
#   name                     = each.key
#   ip_cidr_range            = each.value
#   network                  = google_compute_network.vpc.name
#   private_ip_google_access = false
# }

#private and public subnets will be created with one resource
resource "google_compute_subnetwork" "subnet" {
  count         = var.subnet_count
  network       = google_compute_network.vpc.id
  name           = "${var.public_subnet_count >= count.index + 1 ? "public-subnet" : "private-subnet"}-${count.index + 1}"

  ip_cidr_range = "${count.index < var.public_subnet_count ? var.public_subnet_cidr_ranges[count.index] : var.private_subnet_cidr_ranges[count.index - var.public_subnet_count]}"
  private_ip_google_access = (count.index + 1) <= var.public_subnet_count ? false : true
}

#route
resource "google_compute_route" "egress_internet" {
  name             = "egress-internet"
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc.name
  next_hop_gateway = "default-internet-gateway"
}

#router
resource "google_compute_router" "router" {
  name    = "${local.owner}-router"
  region  = var.region
  network = google_compute_network.vpc.name
}

#nat_router
resource "google_compute_router_nat" "nat_router" {
  name                               = "${local.owner}-nat-router"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = var.nat_ip_allocate_option
  source_subnetwork_ip_ranges_to_nat = var.source_subnetwork_ip_ranges_to_nat

  subnetwork {
    name                    = google_compute_subnetwork.subnet[1].id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}

#==================================FOR SQL======================================#
# We need to allocate an IP block for private IPs. We want everything in the VPC
# to have a private IP. This improves security and latency, since requests to
# private IPs are routed through Google's network, not the Internet.
resource "google_compute_global_address" "private_ip_block" {
  name         = "private-ip-block"
  description  = "A block of private IP addresses that are accessible only from within the VPC."
  purpose      = "VPC_PEERING"
  address_type = "INTERNAL"
  ip_version   = "IPV4"
  # We don't specify a address range because Google will automatically assign one for us.
  prefix_length = 20 # ~4k IPs
  network       = google_compute_network.vpc.id
}

# This enables private services access. This makes it possible for instances
# within the VPC and Google services to communicate exclusively using internal
resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.vpc.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_block.name]
}

# We'll need this to connect to the Cloud SQL Proxy.
resource "google_compute_firewall" "allow_ssh" {
  name        = "allow-ssh"
  description = "Allow SSH traffic to any instance tagged with 'ssh-enabled'"
  network     = google_compute_network.vpc.name
  direction   = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-enabled"]
}