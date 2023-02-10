# ####
# //Launch Template with AMI


resource "aws_launch_template" "template" {

  name = "${var.env}-template"

  instance_type          = var.instance_type
  update_default_version = true
}


