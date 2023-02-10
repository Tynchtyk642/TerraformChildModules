

# *Terraform AWS EKS, EC2 Instance, and VPC Modules
## This module deploys an Amazon EKS cluster, EC2 instances, and a VPC using Terraform.

## Requirements
# *This module requires Terraform 0.12 or later and the following Terraform providers:

## AWS Provider v2.0 or later
## Terraform EKS Provider v0.1 or later
## Variables
# This module takes the following variables as input:

- *vpc_cidr (required) - The CIDR block for the VPC.*
- *public_subnet_cidr (required) - The CIDR block for the public subnet.*
- *private_subnet_cidr (required) - The CIDR block for the private subnet.*
- *cluster_name (required) - The name of the Amazon EKS cluster.*
- *instance_type (optional, default: t2.micro) - The type of EC2 instance to be used as the bastion host.*
## Outputs
# This module outputs the following values:

- *vpc_id - The ID of the VPC.*
- *public_subnet_id - The ID of the public subnet.*
- *private_subnet_id - The ID of the private subnet.*
- *eks_cluster_id - The ID of the Amazon EKS cluster.*
- *instance_public_ip - The public IP address of the bastion host EC2 instance.*
## Usage
# To use this module, add the following code to your Terraform configuration:

```terraform
 module "eks_cluster" {
  source = "git::<URL_OF_THIS_REPO>//eks_cluster?ref=main"

  env         = <env_name>
  vpc_id      = <vpc_id>
  eks_name    = "test1"
  eks_version = "1.20"
  subnets     = <list of Private Subnets>
  vpn_cidr    = <CIDR Block list of Public Subnets>
  region      = "us-east-1"

  node_groups = {
    first = {
      node_group_name = "test"
      desired_size    = 3
      max_size        = 4
      min_size        = 2

      ami_type       = "AL2_x86_64"
      instance_types = ["t2.medium"]
    },
  }
}
```
# Then run terraform init and terraform apply to deploy the VPC, EC2 instances, and Amazon EKS cluster.

## Limitations
# This module is currently only supported in the us-west-2 region.

## License
# This module is licensed under the Apache 2.0 License. Please review the LICENSE file for more information.
