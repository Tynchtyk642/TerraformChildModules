## Terraform GKE Cluster Module 
This Terraform module creates a Google Kubernetes Engine (GKE) cluster in Google Cloud Platform (GCP).

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Usage

``` terraform
module "gke" {
  source = "gke"

  network_name   = module.vpc.vpc
  private_subnet = module.vpc.subnets["subnet3"]
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
| [google_container_cluster.primary](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_container_node_pool.node_pools](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [google_service_account.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_container_engine_versions.my-gke](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/container_engine_versions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The location in which the cluster master will be created, as well as the default node location. | `string` | `"us-east1"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name or self\_link of the GCE network to which the cluster is connected. | `string` | n/a | yes |
| <a name="input_oauth_scopes"></a> [oauth\_scopes](#input\_oauth\_scopes) | Scopes that are used by NAP and GKE Autopilot when creating node pools. | `list(string)` | <pre>[<br>  "https://www.googleapis.com/auth/logging.write",<br>  "https://www.googleapis.com/auth/monitoring",<br>  "https://www.googleapis.com/auth/ndev.clouddns.readwrite",<br>  "https://www.googleapis.com/auth/cloud-platform"<br>]</pre> | no |
| <a name="input_preemptible"></a> [preemptible](#input\_preemptible) | Whether the instance should be a preemptible instance. | `bool` | `true` | no |
| <a name="input_private_subnet"></a> [private\_subnet](#input\_private\_subnet) | The name or self\_link of the GCE subnetwork in which the cluster's instances are launched. | `string` | n/a | yes |
| <a name="input_remove_default_node_pool"></a> [remove\_default\_node\_pool](#input\_remove\_default\_node\_pool) | If true, deletes the default node pool upon cluster creation. | `bool` | `true` | no |
