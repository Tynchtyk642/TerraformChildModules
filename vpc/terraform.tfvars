# aws_access_key = "AKIAQBV63XGN7R5LJ5WO"
# aws_secret_key = "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"

region                   = "us-east-1"
availability_zones_count_public = 3

project = "final_project_kylychbek"

vpc_cidr         = "10.0.0.0/16"
subnet_cidr_bits = 8
private_subnet = ["10.0.2.0/24","10.0.22.0/24","10.0.44.0/24"]

public_subnet = ["10.0.1.0/24","10.0.11.0/24"]