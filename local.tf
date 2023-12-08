locals {
  enable_dns_validation = var.hosted_zone_id != null && var.domain_name_override == null
}
