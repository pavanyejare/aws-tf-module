
resource "aws_route53_record" "record" {
  zone_id = var.zone-id
  name    = var.domain-name
  type    = "NS"
  ttl     = "30"
  records = var.record
}

