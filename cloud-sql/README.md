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
| [google_sql_database_instance.instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |
| [google_sql_database_instance.read_replica](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_depends_on"></a> [db\_depends\_on](#input\_db\_depends\_on) | A single resource that the database instance depends on | `any` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | deletion policy if needed | `bool` | `false` | no |
| <a name="input_ipv4_enabled"></a> [ipv4\_enabled](#input\_ipv4\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | A link to the VPC where the db will live (i.e. google\_compute\_network.some\_vpc.self\_link) | `string` | n/a | yes |
| <a name="input_read_replica_name"></a> [read\_replica\_name](#input\_read\_replica\_name) | Name for read replica | `string` | `"read-replica-for-master"` | no |
| <a name="input_sql_disk_size"></a> [sql\_disk\_size](#input\_sql\_disk\_size) | size on disk depending on demand | `number` | `"100"` | no |
| <a name="input_sql_name"></a> [sql\_name](#input\_sql\_name) | SQL private instance's name | `string` | `"nurda-mssql-private-instance"` | no |
| <a name="input_sql_password"></a> [sql\_password](#input\_sql\_password) | root password can be set | `string` | `"password"` | no |
| <a name="input_sql_region"></a> [sql\_region](#input\_sql\_region) | region where sql private instance will be created | `string` | n/a | yes |
| <a name="input_sql_tier"></a> [sql\_tier](#input\_sql\_tier) | Instance might be changed depending on demand | `string` | `"db-custom-32-122880"` | no |
| <a name="input_sql_version"></a> [sql\_version](#input\_sql\_version) | Only 'SQLSERVER\_2019\_ENTERPRISE' version can be used in order to cerate Read-Replica | `string` | `"SQLSERVER_2019_ENTERPRISE"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | zone for read replica | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_master_instance_name"></a> [master\_instance\_name](#output\_master\_instance\_name) | n/a |
| <a name="output_read_replica_name"></a> [read\_replica\_name](#output\_read\_replica\_name) | n/a |
