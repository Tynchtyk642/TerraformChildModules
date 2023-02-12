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
| [google_compute_address.static](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_instance.connect-instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ins_depends_on"></a> [ins\_depends\_on](#input\_ins\_depends\_on) | instance depends on public subnet | `any` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | we leave it as a variable because we specify existing network on root module | `any` | n/a | yes |
| <a name="input_subnetwork"></a> [subnetwork](#input\_subnetwork) | we leave it as a variable because we specify existing subnetwork on root module | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance-name"></a> [instance-name](#output\_instance-name) | the name of instance |
| <a name="output_ip-address"></a> [ip-address](#output\_ip-address) | reserved ip of instance to ssh and connect to private sql |
