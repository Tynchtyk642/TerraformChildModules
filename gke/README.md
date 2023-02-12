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
| [google_container_cluster.app_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_container_node_pool.container_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authorized_ipv4_cidr_block"></a> [authorized\_ipv4\_cidr\_block](#input\_authorized\_ipv4\_cidr\_block) | The CIDR block where HTTPS access is allowed from | `string` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `"nur-cluster"` | no |
| <a name="input_depends_on_subnetwork"></a> [depends\_on\_subnetwork](#input\_depends\_on\_subnetwork) | GKE depends on subnet creation | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | for the latest available version of GKE | `any` | n/a | yes |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | n/a | `string` | `"g1-small"` | no |
| <a name="input_master_ipv4_cidr_block"></a> [master\_ipv4\_cidr\_block](#input\_master\_ipv4\_cidr\_block) | The /28 CIDR block to use for the master IPs | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | The name of the app VPC | `string` | n/a | yes |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | n/a | `string` | `"nur-node-pool"` | no |
| <a name="input_node_zones"></a> [node\_zones](#input\_node\_zones) | The zones where worker nodes are located | `list(string)` | n/a | yes |
| <a name="input_pods_ipv4_cidr_block"></a> [pods\_ipv4\_cidr\_block](#input\_pods\_ipv4\_cidr\_block) | The CIDR block to use for pod IPs | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The project ID to host the network in | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region to use | `string` | n/a | yes |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | The service account to use | `string` | n/a | yes |
| <a name="input_services_ipv4_cidr_block"></a> [services\_ipv4\_cidr\_block](#input\_services\_ipv4\_cidr\_block) | The CIDR block to use for the service IPs | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The name of the app subnet | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags for environment | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The Kubernetes cluster name. |
