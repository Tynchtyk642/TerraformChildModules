//✎﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏𝐒𝐄𝐂𝐔𝐑𝐈𝐓𝐘 𝐆𝐑𝐎𝐔𝐏 𝐅𝐎𝐑 𝐓𝐇𝐄 𝐍𝐎𝐃𝐄 𝐆𝐑𝐎𝐔𝐏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
resource "aws_security_group" "js-sg-node" {
        name        = "${var.env}-security_group-cluster"
        vpc_id      = var.vpc
  dynamic "ingress" {
        for_each = var.ingress 
  content {
        from_port = ingress.value
        to_port = ingress.value
        protocol = "-1"
        cidr_blocks =  ["0.0.0.0/0"]
    }
  }
  egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
}
//✎﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏𝐒𝐄𝐂𝐔𝐑𝐈𝐓𝐘 𝐆𝐑𝐎𝐔𝐏 𝐅𝐎𝐑 𝐋𝐀𝐔𝐍𝐂𝐇 𝐓𝐄𝐌𝐏𝐋𝐀𝐓𝐄﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
resource "aws_security_group" "for_launch-sg" {
        name        = "for-launch_templ"
        description = "Allow TLS inbound traffic"
        vpc_id      = var.vpc

  ingress {
        description      = "TLS from VPC"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow_tls"
    }
}