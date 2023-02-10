## VPC Module for Google Cloud Platform (GCP) 
This Terraform module creates a Virtual Private Cloud (VPC) in Google Cloud Platform (GCP). The VPC network has multiple subnets, each with its own IP range, region, and access type.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Usage

``` terraform
module "sql" {
  source = "cloud-sql"

  private_network = module.vpc.vpc
  depends_on      = [module.vpc.private_vpc_connection]
  ead_replicas = var.replicas
}
```
Then perform the following commands on the root folder: 
 
+ `terraform init` terraform initialization 
+ `terraform plan` to see the infrastructure plan 
+ `therraform apply` to apply infastructure build 
+ `terraform destroy` to destroy the build infastructure

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_global_address.private_ip_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_network.custom-test](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_router.router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.subnets](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_service_networking_connection.private_vpc_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_type"></a> [address\_type](#input\_address\_type) | INTERNAL indicates internal IP ranges belonging to some network. | `string` | `"INTERNAL"` | no |
| <a name="input_auto_create_subnetworks"></a> [auto\_create\_subnetworks](#input\_auto\_create\_subnetworks) | When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources. | `bool` | `false` | no |
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | This is the name of the firewall that will be created. | `string` | `"firewall-rule-ssh"` | no |
| <a name="input_nat_ip_allocate_option"></a> [nat\_ip\_allocate\_option](#input\_nat\_ip\_allocate\_option) | How external IPs should be allocated for this NAT. | `string` | `"AUTO_ONLY"` | no |
| <a name="input_nat_name"></a> [nat\_name](#input\_nat\_name) | Name of the NAT Service | `string` | `"my-router-nat-lunara"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the network being created | `string` | `"lunaras-network"` | no |
| <a name="input_private_ip_google_access"></a> [private\_ip\_google\_access](#input\_private\_ip\_google\_access) | When enabled, VMs in this subnetwork without external IP addresses can access Google APIs and services by using Private Google Access. | `bool` | `true` | no |
| <a name="input_private_ip_name"></a> [private\_ip\_name](#input\_private\_ip\_name) | This argument specifies the name of the global address resource. | `string` | `"private-ip-address"` | no |
| <a name="input_purpose"></a> [purpose](#input\_purpose) | The purpose of the resource. | `string` | `"VPC_PEERING"` | no |
| <a name="input_region"></a> [region](#input\_region) | The GCP region for this subnetwork. | `string` | `"us-west1"` | no |
| <a name="input_router_name"></a> [router\_name](#input\_router\_name) | Name of the router that will be created. | `string` | `"my-router"` | no |
| <a name="input_source_ranges"></a> [source\_ranges](#input\_source\_ranges) | If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges. | `list` | `[]` | no |
| <a name="input_source_subnetwork_ip_ranges_to_nat"></a> [source\_subnetwork\_ip\_ranges\_to\_nat](#input\_source\_subnetwork\_ip\_ranges\_to\_nat) | How NAT should be configured per Subnetwork. | `string` | `"ALL_SUBNETWORKS_ALL_IP_RANGES"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | It will create a subnet for each region | <pre>map(object({<br>    subnet_name = string<br>    cidr_block = string <br>    region = string <br>    private_ip_google_access = bool<br>  }))</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The firewall will apply only to traffic with source IP that belongs to a tag listed in source tags. | `list(any)` | <pre>[<br>  "environment-dev"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_vpc_connection"></a> [private\_vpc\_connection](#output\_private\_vpc\_connection) | n/a |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | n/a |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | n/a |
