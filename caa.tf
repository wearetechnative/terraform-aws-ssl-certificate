locals {
  caa_record = "0 issue \"amazon.com\""
}

# required in some cases so ACM allows to issue certificates
resource "aws_route53_record" "caa" {
  count = local.enable_dns_validation ? 1 : 0

  allow_overwrite = true

  name            = local.fqdn
  records         = [ local.caa_record ]
  ttl             = 60
  type            = "CAA"
  zone_id         = data.aws_route53_zone.this[0].zone_id
}
