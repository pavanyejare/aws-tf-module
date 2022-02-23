resource "aws_instance" "ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.zone
  tags                   = var.tag
  key_name               = var.ssh_key
  vpc_security_group_ids = var.security_group
  subnet_id              = var.subnet

}
