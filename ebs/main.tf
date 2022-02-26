resource "aws_ebs_volume" "ebs" {
  availability_zone = var.availability_zone
  size              = var.size
  tags              = var.tags
  type              = var.type
}

output "ebs" { value = aws_ebs_volume.ebs.id }
