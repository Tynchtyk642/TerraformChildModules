## Terraform GKE Cluster Module
This Terraform module creates a Google Kubernetes Engine (GKE) cluster in Google Cloud Platform (GCP).

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Usage

```terraform

module "gke" {
  source                     = "../../child_module/gke"
  name                       = "dev-cluster-zhakyp"
  region                     = "us-central1"
  zones                      = ["us-central1-a", "us-central1-b", "us-central1-f"]
  network_name               = module.vpc.network_name
  subnet_name                = module.vpc.subnet_name[4]
  ip_range_pods              = module.vpc.cluster_pods_ip_cidr_range
  ip_range_services          = module.vpc.cluster_services_ip_cidr_range
  master_ipv4_cidr_block     = module.vpc.cluster_master_ip_cidr_range
  network_policy             = false
  horizontal_pod_autoscaling = true
  enable_private_endpoint    = true
  enable_private_nodes       = true
  authorized_ipv4_cidr_block = "10.0.0.0/32"
}

```
Then perform the following commands on the root folder:

+ `terraform init` terraofrm initialization
+ `terraform plan` to see the infrastructure plan
+ `therraform apply` to apply infastructure build
+ `terraform destroy` to destroy the build infastructure

## Resources

| Name | Type |
|------|------|
| [google_container_cluster.primary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_container_node_pool.node_pools](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [google_service_account.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_container_engine_versions.central1b](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/container_engine_versions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authorized_ipv4_cidr_block"></a> [authorized\_ipv4\_cidr\_block](#input\_authorized\_ipv4\_cidr\_block) | The range of IPv4 addresses authorized to access the VPC. | `string` | `null` | no |
| <a name="input_auto_repair"></a> [auto\_repair](#input\_auto\_repair) | Whether the instance should be automatically repaired. | `bool` | `true` | no |
| <a name="input_auto_upgrade"></a> [auto\_upgrade](#input\_auto\_upgrade) | Whether the nodes in the cluster should be automatically upgraded. | `bool` | `true` | no |
| <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint) | (Beta) Whether the master's internal IP address is used as the cluster endpoint | `bool` | `false` | no |
| <a name="input_enable_private_nodes"></a> [enable\_private\_nodes](#input\_enable\_private\_nodes) | (Beta) Whether nodes have internal IP addresses only | `bool` | `false` | no |
| <a name="input_horizontal_pod_autoscaling"></a> [horizontal\_pod\_autoscaling](#input\_horizontal\_pod\_autoscaling) | Enable horizontal pod autoscaling addon | `bool` | `true` | no |
| <a name="input_ip_range_pods"></a> [ip\_range\_pods](#input\_ip\_range\_pods) | The range of IP addresses to be used for pods in the Kubernetes cluster. | `string` | n/a | yes |
| <a name="input_ip_range_services"></a> [ip\_range\_services](#input\_ip\_range\_services) | The range of IP addresses to be used for services in the Kubernetes cluster. | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | The location where the instance should be deployed. | `string` | `"us-west1"` | no |
| <a name="input_master_ipv4_cidr_block"></a> [master\_ipv4\_cidr\_block](#input\_master\_ipv4\_cidr\_block) | The IPv4 network range for the master network. | `string` | n/a | yes |
| <a name="input_max_node_count"></a> [max\_node\_count](#input\_max\_node\_count) | The maximum number of nodes in the auto-scaling group. | `number` | `5` | no |
| <a name="input_min_node_count"></a> [min\_node\_count](#input\_min\_node\_count) | The minimum number of nodes in the auto-scaling group. | `number` | `2` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the cluster (required) | `string` | `""` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The VPC network to host the cluster in (required) | `string` | `""` | no |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Enable network policy addon | `bool` | `false` | no |
| <a name="input_node_name"></a> [node\_name](#input\_node\_name) | The name of node | `string` | `"cluster-node"` | no |
| <a name="input_oauth_scopes"></a> [oauth\_scopes](#input\_oauth\_scopes) | The OAuth scopes associated with the instance. | `list(string)` | <pre>[<br>  "https://www.googleapis.com/auth/logging.write",<br>  "https://www.googleapis.com/auth/monitoring",<br>  "https://www.googleapis.com/auth/ndev.clouddns.readwrite",<br>  "https://www.googleapis.com/auth/cloud-platform"<br>]</pre> | no |
| <a name="input_preemptible"></a> [preemptible](#input\_preemptible) | Whether the instance should be a preemptible instance. | `bool` | `true` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to host the cluster in (optional if zonal cluster / required if regional) | `string` | `null` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The subnetwork to host the cluster in (required) | `string` | `""` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | The zones to host the cluster in (optional if regional cluster / required if zonal) | `list(string)` | `[]` | no |

