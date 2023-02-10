## VPC Module for Google Cloud Platform (GCP)
This Terraform module creates a Virtual Private Cloud (VPC) in Google Cloud Platform (GCP). The VPC network has multiple subnets, each with its own IP range, region, and access type.


## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

```terraform
module "vpc" {
  source          = "vpc"
  network_name    = "zhakypsnetwork"
  nat_subnet_name = "privatesubnet3"
  subnets = [
    {
      subnet_name     = "privatesubnet1"
      subnet_ip_range = var.privatesubnet1
      subnet_region   = "us-west1"
    },
    {
      subnet_name           = "privatesubnet2"
      subnet_ip_range       = var.privatesubnet2
      subnet_region         = "us-central1"
      subnet_private_access = true
    },
    {
      subnet_name           = "privatesubnet3"
      subnet_ip_range       = var.privatesubnet3
      subnet_region         = "us-central1"
      subnet_private_access = true
    },
      {
      subnet_name           = "publicsubnet1"
      subnet_ip_range       = var.publicsubnet1
      subnet_region         = "us-west1"
      subnet_private_access = false
    },
    {
      subnet_name           = "publicsubnet2"
      subnet_ip_range       = var.publicsubnet2
      subnet_region         = "us-central1"
      subnet_private_access = false
    },

  ]
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
| [google_compute_firewall.rules](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_global_address.private_ip_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_network.vpc_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_router.router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.private-test](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_service_networking_connection.private_vpc_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_networking_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_subnetworks"></a> [auto\_create\_subnetworks](#input\_auto\_create\_subnetworks) | When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources. | `bool` | `false` | no |
| <a name="input_nat_subnet_name"></a> [nat\_subnet\_name](#input\_nat\_subnet\_name) | The name of the subnet that should be used for NAT. | `string` | `"nat-subnet"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the virtual network that the instance should be connected to. | `string` | `"vpc"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the instance should be deployed. | `string` | `"us-central1"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | It will create a subnet for each region | `list(map(string))` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_master_ip_cidr_range"></a> [cluster\_master\_ip\_cidr\_range](#output\_cluster\_master\_ip\_cidr\_range) | This output can be used to retrieve the IP address range for the cluster master in the desired network |
| <a name="output_cluster_pods_ip_cidr_range"></a> [cluster\_pods\_ip\_cidr\_range](#output\_cluster\_pods\_ip\_cidr\_range) | The CIDR range to use for Kubernetes cluster pods |
| <a name="output_cluster_services_ip_cidr_range"></a> [cluster\_services\_ip\_cidr\_range](#output\_cluster\_services\_ip\_cidr\_range) | The CIDR range to user for Kubernetes cluster services |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | This Terraform output provides the ID of a custom Google Compute Network. |
| <a name="output_private_vpc_connection"></a> [private\_vpc\_connection](#output\_private\_vpc\_connection) | This Terraform output provides the connection resource of a private VPC |
| <a name="output_subnet_name"></a> [subnet\_name](#output\_subnet\_name) | This Terraform output generates a map of key-value pairs, where the key is the name of a subnetwork and the value is the corresponding subnetwork ID. |
