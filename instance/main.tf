//✎﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏𝐁𝐀𝐒𝐓𝐈𝐎𝐍 𝐇𝐎𝐒𝐓﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏﹏
resource "aws_instance" "bastion" {
 
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.ec2_type
  security_groups      = [var.ec2-sg]
  associate_public_ip_address = true
  subnet_id                   = var.public_subnet
   tags = {
        Name = "${var.env}-bastion_host"
        environment = "${var.env}"
      }
}
data "aws_ami" "ubuntu" {
    most_recent      = true
    owners           = ["704109570831"]
  }
