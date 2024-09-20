resource "aws_acm_certificate" "this" {
  provider = aws.acm_certificate_region

  domain_name       = var.name
  validation_method = "DNS"
}

resource "aws_route53_record" "validation_record" {
  allow_overwrite = true
  name            = one(aws_acm_certificate.this.domain_validation_options).resource_record_name
  records         = [one(aws_acm_certificate.this.domain_validation_options).resource_record_value]
  ttl             = 60
  type            = one(aws_acm_certificate.this.domain_validation_options).resource_record_type
  zone_id         = var.hosted_zone_id
}

resource "aws_acm_certificate_validation" "validation_wait" {
  provider = aws.acm_certificate_region

  certificate_arn         = aws_acm_certificate.this.arn
  validation_record_fqdns = [one(aws_acm_certificate.this.domain_validation_options).resource_record_name]

  timeouts {
    create = "3m" # low for testing, 45m by default
  }
}
