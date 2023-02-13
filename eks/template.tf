resource "aws_launch_template" "eks_worker_nodes_template" {
  name           = "kylychbek"
#   capacity_type  = "ON_DEMAND" # ON_DEMAND, SPOT
#   disk_size      = 20
  instance_type = "t2.micro"
  tags = {
    Name = "Final_kylych"
  }
}
