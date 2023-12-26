resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "${var.record_name}.${data.aws_route53_zone.primary.name}"
  type    = var.type
  ttl     = 300
  records = ["3.255.242.95"]
}