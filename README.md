# Terraform AWS SSL Certificate ![](https://img.shields.io/github/workflow/status/TechNative-B-V/terraform-aws-module-name/tflint.yaml?style=plastic)

<!-- SHIELDS -->

[![](we-are-technative.png)](https://www.technative.nl)

Helper module to simplify ACM certificate fetching and validation. Tested and
used for ALB and CloudFront.

Use an us-east-1 provider for aws.acm_certificate_region if you need
certificates for CloudFront.

When `var.domain_name_override` is provided then `var.hosted_zone_id` is
assumed NULL and then certificates will be created assuming an external DNS
will verify this. The module will output on `manual_provisioning_instructions`
on how to verify and this output can also be reused by other providers (e.g.
CloudFlare).

## How does it work

...

## Usage

To use this module ...

```hcl
{
  some_conf = "might need explanation"
}
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=4.21.0 |
| <a name="provider_aws.acm_certificate_region"></a> [aws.acm\_certificate\_region](#provider\_aws.acm\_certificate\_region) | >=4.21.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.validation_wait](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_route53_record.caa](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.validation_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name_override"></a> [domain\_name\_override](#input\_domain\_name\_override) | Domain name to create SSL certificate for if hosted\_zone\_id is not provided. Will prepend var.name with a dot in front of it. | `string` | `null` | no |
| <a name="input_hosted_zone_id"></a> [hosted\_zone\_id](#input\_hosted\_zone\_id) | Authoritative hosted zone that can validate the SSL certificate. Set to null for manual certificate provisioning. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Full service name to add to domain name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_certificate_arn"></a> [acm\_certificate\_arn](#output\_acm\_certificate\_arn) | n/a |
| <a name="output_acm_certificate_fqdn"></a> [acm\_certificate\_fqdn](#output\_acm\_certificate\_fqdn) | n/a |
| <a name="output_manual_provisioning_instructions"></a> [manual\_provisioning\_instructions](#output\_manual\_provisioning\_instructions) | n/a |
<!-- END_TF_DOCS -->
