variable "origin" {
  type = object({
    domain_name = string
    origin_id = string
    root_object = string
    origin_path = string
    protocol_policy = string
  })
  description = "s3 bucket config description"
}
variable "domain_aliases" {
  type = list(string)
  description = "domain aliases list"
  default = []
}
variable "cache_behavior_allowed_methods" {
  type = list(string)
  default = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
}
variable "cache_behavior_cache_methods" {
  type = list(string)
  default = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
}
variable "price_class" {
  type = string
  default = "PriceClass_All"
  description = "edge locations coverage"
}
variable "web_acl_id" {
  type = string
  default = null
}
variable "restrictions" {
  type = object({
    restriction_type = string
    locations = list(string)
  })
  default = {
    restriction_type = "none"
    locations = []
  }
}

variable "use_custom_origin_config" {
  type = bool
  default = true
  description = "optional server selection"
}

variable "default_cache_behavior" {
  type = object({
    path_pattern = string
    allowed_methods = list(string)
    cached_methods = list(string)
    viewer_protocol_policy = string
    query_string = bool
    forward = string
    headers = list(string)
  })
  default = {
    path_pattern = "*"
    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods = ["GET", "HEAD"]
    viewer_protocol_policy = "allow-all"
    query_string = true
    forward = "all"
    headers = ["*"]
  }
}
variable "viewer_certificate" {
  type = object({
    is_cloudfront_default_certificate = bool
    acm_certificate_arn = string
  })
  default = {
    acm_certificate_arn = null
    is_cloudfront_default_certificate = true
    ssl_support_method = null
  }
}

variable "origin_access_control" {
  type = object({
    name = string
    signing_behavior = string
    signing_protocol = string
    origin_type = string
  })
  default = null
}
variable "global_tags" {
  type = object({
    Author      = string
    Environment = string
    Provisioner = string
    Region      = string
  })
  description = "base tags required in every resource"
}