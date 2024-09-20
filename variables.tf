variable "name" {
  description = "Full domain name for certificate"
  type        = string
}

variable "hosted_zone_id" {
  description = "Authoritative hosted zone that can validate the SSL certificate."
  type        = string
}
