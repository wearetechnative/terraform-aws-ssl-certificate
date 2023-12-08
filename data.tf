data "aws_route53_zone" "this" {
  count = local.enable_dns_validation ? 1 : 0
  zone_id = var.hosted_zone_id
}
