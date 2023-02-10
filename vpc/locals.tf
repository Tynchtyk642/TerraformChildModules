
   locals {
  firewall_allow = [ 
    { protocol = "tcp", ports = ["22", "80"] }, 
    { protocol = "icmp" } 
  ] 
   }
