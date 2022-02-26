#resource "aws_efs_file_system" "efs" {
#  creation_token   = var.efs_name
#  performance_mode = "generalPurpose"
#  throughput_mode  = "bursting"
#  tags = {
#    Name = var.efs_name
#  }
#}
#
#
#locals {
#  subnet = ["subnet-09ae4ee972270c150", "subnet-029ca27edd119efcb"]
#}
#
#resource "aws_efs_mount_target" "efs_mount" {
#  count           = length(var.subnet)
#  file_system_id  = aws_efs_file_system.efs.id
#  subnet_id       = tolist(var.subnet)[count.index]
#  security_groups = [var.service_security_group]
#}

