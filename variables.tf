variable "name" {
  description = "Full service name to add to domain name."
  type        = string
}

variable "hosted_zone_id" {
  description = "Authoritative hosted zone that can validate the SSL certificate. Set to null for manual certificate provisioning."
  type = string
}

variable "domain_name_override" {
  description = "Domain name to create SSL certificate for if hosted_zone_id is not provided. Will prepend var.name with a dot in front of it."
  type = string
  default = null
}
