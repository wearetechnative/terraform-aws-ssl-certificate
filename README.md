# ssl_certificate

Helper module to simplify ACM certificate fetching and validation. Tested and used for ALB and CloudFront.

Use an us-east-1 provider for aws.acm_certificate_region if you need certificates for CloudFront.

## Example module usage

Below is an example on how you would use the module.

``
module "ssl_cert" {

    source = "../../technative_modules/ssl_certificate"

    name = aws_route53_zone.primary_enviroment.name
    hosted_zone_id = aws_route53_zone.primary_enviroment.zone_id

    providers = {
        aws.acm_certificate_region = aws
    }
}
``
