output "acm_certificate_arn" {
  value = aws_acm_certificate.this.arn
}

output "acm_certificate_fqdn" {
  value = local.fqdn
}

output "manual_provisioning_instructions" {
  value = local.enable_dns_validation ? null : {
    fqdn = "${var.name}.${var.domain_name_override}"
    records = {
      "CAA": {"name": "${var.name}.${var.domain_name_override}", "value": local.caa_record }
      "${one(aws_acm_certificate.this.domain_validation_options).resource_record_type}": { "name": one(aws_acm_certificate.this.domain_validation_options).resource_record_name, "value": one(aws_acm_certificate.this.domain_validation_options).resource_record_value }
    }
  }
}
