

# *Terraform AWS EKS, EC2 Instance, and VPC Deployment
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

## hcl
Copy code
## module "eks_cluster" {
  - *source = "github.com/your-repository-url.git"*

  - *vpc_cidr         = "10.0.0.0/16"*
  - *public_subnet_cidr = "10.0.1.0/24"*
  - *private_subnet_cidr = "10.0.2.0/24"*
  - *cluster_name     = "my-eks-cluster"*
}
# Then run terraform init and terraform apply to deploy the VPC, EC2 instances, and Amazon EKS cluster.

## Limitations
# This module is currently only supported in the us-west-2 region.

## License
# This module is licensed under the Apache 2.0 License. Please review the LICENSE file for more information.
