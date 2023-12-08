locals {
  fqdn = "${var.name}.${var.domain_name_override == null ? data.aws_route53_zone.this[0].name : var.domain_name_override}"
}

resource "aws_acm_certificate" "this" {
  provider = aws.acm_certificate_region

  domain_name       = local.fqdn
  validation_method = "DNS"
}

resource "aws_route53_record" "validation_record" {
  count = local.enable_dns_validation ? 1 : 0

  allow_overwrite = true
  name            = one(aws_acm_certificate.this.domain_validation_options).resource_record_name
  records         = [ one(aws_acm_certificate.this.domain_validation_options).resource_record_value ]
  ttl             = 60
  type            = one(aws_acm_certificate.this.domain_validation_options).resource_record_type
  zone_id         = data.aws_route53_zone.this[0].zone_id

  depends_on = [
    aws_route53_record.caa # if CAA does not exist but is expected then ACM goes into failed state and must be manually deleted, this forces aws_acm_certificate to wait on CAA (propagation) too
  ]
}

resource "aws_acm_certificate_validation" "validation_wait" {
  provider = aws.acm_certificate_region
  count = var.domain_name_override == null ? 1 : 0

  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [ one(aws_acm_certificate.this.domain_validation_options).resource_record_name ]

  timeouts {
    create = "5m" # lower for testing, 45m by default
  }

  depends_on = [
    aws_route53_record.validation_record[0]
  ]
}
