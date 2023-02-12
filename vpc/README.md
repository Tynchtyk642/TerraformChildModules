## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_firewall.allow_ssh](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_global_address.private_ip_block](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_route.egress_internet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_route) | resource |
| [google_compute_router.router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.nat_router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_service_networking_connection.private_vpc_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_subnetworks"></a> [auto\_create\_subnetworks](#input\_auto\_create\_subnetworks) | It will create a subnet for each region automatically across the across CIDR-block range, if it is <true> | `bool` | `false` | no |
| <a name="input_delete_default_routes_on_create"></a> [delete\_default\_routes\_on\_create](#input\_delete\_default\_routes\_on\_create) | n/a | `bool` | `true` | no |
| <a name="input_nat_ip_allocate_option"></a> [nat\_ip\_allocate\_option](#input\_nat\_ip\_allocate\_option) | for nat router | `string` | `"AUTO_ONLY"` | no |
| <a name="input_private_subnet_cidr_ranges"></a> [private\_subnet\_cidr\_ranges](#input\_private\_subnet\_cidr\_ranges) | n/a | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24",<br>  "10.0.3.0/24"<br>]</pre> | no |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to host the network in | `string` | n/a | yes |
| <a name="input_public_subnet_cidr_ranges"></a> [public\_subnet\_cidr\_ranges](#input\_public\_subnet\_cidr\_ranges) | n/a | `list(string)` | <pre>[<br>  "10.0.4.0/24",<br>  "10.0.5.0/24"<br>]</pre> | no |
| <a name="input_public_subnet_count"></a> [public\_subnet\_count](#input\_public\_subnet\_count) | n/a | `number` | `2` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to use | `string` | n/a | yes |
| <a name="input_routing_mode"></a> [routing\_mode](#input\_routing\_mode) | The network routing mode | `string` | `"GLOBAL"` | no |
| <a name="input_source_subnetwork_ip_ranges_to_nat"></a> [source\_subnetwork\_ip\_ranges\_to\_nat](#input\_source\_subnetwork\_ip\_ranges\_to\_nat) | To use for exact subnets | `string` | `"LIST_OF_SUBNETWORKS"` | no |
| <a name="input_subnet_count"></a> [subnet\_count](#input\_subnet\_count) | n/a | `number` | `5` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_master_ip_cidr_range"></a> [cluster\_master\_ip\_cidr\_range](#output\_cluster\_master\_ip\_cidr\_range) | The CIDR range to use for Kubernetes cluster master |
| <a name="output_cluster_pods_ip_cidr_range"></a> [cluster\_pods\_ip\_cidr\_range](#output\_cluster\_pods\_ip\_cidr\_range) | The CIDR range to use for Kubernetes cluster pods |
| <a name="output_cluster_services_ip_cidr_range"></a> [cluster\_services\_ip\_cidr\_range](#output\_cluster\_services\_ip\_cidr\_range) | The CIDR range to use for Kubernetes cluster services |
| <a name="output_first_private_subnet_private_google_ip_access"></a> [first\_private\_subnet\_private\_google\_ip\_access](#output\_first\_private\_subnet\_private\_google\_ip\_access) | n/a |
| <a name="output_google_service_networking_connection"></a> [google\_service\_networking\_connection](#output\_google\_service\_networking\_connection) | will be used for sql |
| <a name="output_network"></a> [network](#output\_network) | The VPC will be used for other modules |
| <a name="output_private_ip_block"></a> [private\_ip\_block](#output\_private\_ip\_block) | will be used for sql |
| <a name="output_private_subnet"></a> [private\_subnet](#output\_private\_subnet) | ===========================OUTPUTS FOR GKE ===============================# |
| <a name="output_private_vpc_connection"></a> [private\_vpc\_connection](#output\_private\_vpc\_connection) | will be used for sql |
| <a name="output_public_subnet"></a> [public\_subnet](#output\_public\_subnet) | n/a |
