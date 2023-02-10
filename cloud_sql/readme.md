## Terraform Google Cloud SQL Database Instance
This Terraform module creates a Google Cloud SQL database instance and one or more read replicas.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

```terraform
module "mssql" {
  source       = "cloud_sql"
  network_name = module.vpc.network_name
  depends_on = [
    module.vpc.private_vpc_connection
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
| [google_sql_database_instance.instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_database_instance.read_replica](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [random_id.db_name_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_type"></a> [availability\_type](#input\_availability\_type) | The availability type of the Cloud SQL instance, high availability (REGIONAL) or single zone (ZONAL). | `string` | `"ZONAL"` | no |
| <a name="input_backup_config"></a> [backup\_config](#input\_backup\_config) | For all instances, ensure that settings.backup\_configuration.enabled is set to false. | `bool` | `false` | no |
| <a name="input_database_version"></a> [database\_version](#input\_database\_version) | SQL Server version to use | `string` | `"SQLSERVER_2019_ENTERPRISE"` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | Whether or not to allow Terraform to destroy the instance | `bool` | `false` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | The size of data disk, in GB | `string` | `"100"` | no |
| <a name="input_failover_target"></a> [failover\_target](#input\_failover\_target) | Specifies if the replica is the failover target. | `bool` | `false` | no |
| <a name="input_ipv4_enabled"></a> [ipv4\_enabled](#input\_ipv4\_enabled) | Cloud SQL instance should be assigned a public IPV4 address | `bool` | `false` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | The name of the virtual network that the instance should be connected to. | `string` | `""` | no |
| <a name="input_read_replicas"></a> [read\_replicas](#input\_read\_replicas) | The variable is defined as a map, which allows it to store multiple read replicas and their respective information. | <pre>map(object({<br>    region = string<br>    zone   = string<br>  }))</pre> | <pre>{<br>  "replica1": {<br>    "region": "us-central1",<br>    "zone": "us-central1-a"<br>  },<br>  "replica2": {<br>    "region": "europe-west1",<br>    "zone": "europe-west1-b"<br>  }<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The region where the instance should be deployed. | `string` | `"us-east1"` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | The machine type to use | `string` | `"db-custom-12-61440"` | no |

