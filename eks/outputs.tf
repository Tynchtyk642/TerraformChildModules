

# resource "aws_vpc" "My_VPC" {
#   cidr_block           = "192.168.0.0/16"
#   instance_tenancy     = "default"
#   enable_dns_support   = "true"
#   enable_dns_hostnames = "true"
 
# tags = {
#     Name = "My VPC"
# }
# }

# resource "aws_subnet" "My_VPC_Subnet" {
#   vpc_id                  = aws_vpc.My_VPC.id
#   cidr_block              = "192.168.0.0/24"
#   map_public_ip_on_launch = "true"
#   availability_zone       = "ap-south-1a"
# tags = {
#    Name = "My VPC Subnet"
# }
# }
# resource "aws_subnet" "My_VPC_Subnet2" {
#   vpc_id                  = aws_vpc.My_VPC.id
#   cidr_block              = "192.168.1.0/24"
#   availability_zone       = "ap-south-1b"
# tags = {
#    Name = "My VPC Subnet"
# }
# }
# resource "aws_internet_gateway" "My_VPC_GW" {
#  vpc_id = aws_vpc.My_VPC.id
#  tags = {
#         Name = "My VPC Internet Gateway"
# }
# }
# resource "aws_route_table" "My_VPC_route_table" {
#  vpc_id = aws_vpc.My_VPC.id
#  tags = {
#         Name = "My VPC Route Table"
# }
# }

# resource "aws_route" "My_VPC_internet_access" {
#   route_table_id         = aws_route_table.My_VPC_route_table.id
#   destination_cidr_block =  "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.My_VPC_GW.id
# }

# resource "aws_route_table_association" "My_VPC_association" {
#   subnet_id      = aws_subnet.My_VPC_Subnet.id
#   route_table_id = aws_route_table.My_VPC_route_table.id
# }

# resource "aws_security_group" "only_ssh_bositon" {
#   depends_on=[aws_subnet.My_VPC_Subnet]
#   name        = "only_ssh_bositon"
#   vpc_id      =  aws_vpc.My_VPC.id

# ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "only_ssh_bositon"
#   }
# }


# resource "aws_security_group" "allow_word" {
#   name        = "allow_word"
#    vpc_id     = aws_vpc.My_VPC.id

# ingress {

#     from_port   = 3306		
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_security_group" "allow_http" {
#   name        = "allow_http"
#    vpc_id     = aws_vpc.My_VPC.id
# ingress {

#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# tags = {
#     Name = "allow_http"
#   }
# }

#  resource "aws_security_group" "only_ssh_sql_bositon" {
#     depends_on=[aws_subnet.My_VPC_Subnet]
#   name        = "only_ssh_sql_bositon"
#   description = "allow ssh bositon inbound traffic"
#   vpc_id      =  aws_vpc.My_VPC.id




#  ingress {
#     description = "Only ssh_sql_bositon in public subnet"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     security_groups=[aws_security_group.only_ssh_bositon.id]
 
#  }



#  egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#     ipv6_cidr_blocks =  ["::/0"]
#   }



#   tags = {
#     Name = "only_ssh_sql_bositon"
#   }
# }
# resource "aws_eip" "abhi_ip" {
#   vpc              = true
#   public_ipv4_pool = "amazon"
# }


# resource "aws_nat_gateway" "abhingw" {
#     depends_on=[aws_eip.abhi_ip]
#   allocation_id = aws_eip.abhi_ip.id
#   subnet_id     = aws_subnet.My_VPC_Subnet.id
# tags = {
#     Name = "abhingw"
#   }
# }

# // Route table for SNAT in private subnet

# resource "aws_route_table" "private_subnet_route_table" {
#       depends_on=[aws_nat_gateway.abhingw]
#   vpc_id = aws_vpc.My_VPC.id


#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_nat_gateway.abhingw.id
#   }



#   tags = {
#     Name = "private_subnet_route_table"
#   }
# }


# resource "aws_route_table_association" "private_subnet_route_table_association" {
#   depends_on = [aws_route_table.private_subnet_route_table]
#   subnet_id      = aws_subnet.My_VPC_Subnet2.id
#   route_table_id = aws_route_table.private_subnet_route_table.id
# }

# resource "aws_instance" "BASTION" {
#   ami           = "ami-0732b62d310b80e97"
#   instance_type = "t2.micro"
#   subnet_id = aws_subnet.My_VPC_Subnet.id
#   vpc_security_group_ids = [ aws_security_group.only_ssh_bositon.id ]
#   key_name = "task1-key"

#   tags = {
#     Name = "bastionhost"
#     }
# }
# resource "aws_instance" "database" {
#   ami           = "ami-0019ac6129392a0f2"
#   instance_type = "t2.micro"
#   subnet_id = aws_subnet.My_VPC_Subnet2.id
#   vpc_security_group_ids = [ aws_security_group.allow_word.id,aws_security_group.only_ssh_sql_bositon.id]
#   key_name = "task1-key"

#   tags = {
#     Name = "database"
#     }
# }
#   resource "aws_instance" "wordpress_os" {
#   ami           = "ami-000cbce3e1b899ebd"
#   instance_type = "t2.micro"
#   subnet_id = aws_subnet.My_VPC_Subnet.id
#   vpc_security_group_ids = [ aws_security_group.allow_http.id ]
#    key_name = "task1-key"


#   tags = {
#     Name = "wordpress"
#     }
# }
