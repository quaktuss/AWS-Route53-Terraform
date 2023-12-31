resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "${var.record_name}.${data.aws_route53_zone.primary.name}"
  type    = var.type
  ttl     = 300
  records = ["34.255.195.138"]
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = "${var.record_name}.${data.aws_route53_zone.primary.name}"
  zone_id      = data.aws_route53_zone.primary.zone_id

  validation_method = "DNS"

# subject_alternative_names = [
#   "*.my-domain.com",
#   "app.sub.my-domain.com",
# ]

  wait_for_validation = true

  tags = {
    Name = "terraform-test.matih.eu"
  }
}