resource "aws_cloudfront_distribution" "default" {
  origin {
    domain_name              = var.origin["domain_name"]
    origin_access_control_id = var.origin_access_control != null ? aws_cloudfront_origin_access_control.default[0].id : null
    origin_id                = var.origin["origin_id"]
    origin_path = var.origin["origin_path"]

    dynamic "custom_origin_config" {
      for_each = var.use_custom_origin_config == true ? [1] : []
      content {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = var.origin["protocol_policy"]
        origin_ssl_protocols   = ["TLSv1","TLSv1.1","TLSv1.2"]
      }
			
    }

  }

  enabled             = true
  is_ipv6_enabled     = true

  aliases = var.domain_aliases

  web_acl_id = var.web_acl_id 

  default_cache_behavior {
    allowed_methods  = var.default_cache_behavior["allowed_methods"]
    cached_methods   = var.default_cache_behavior["cached_methods"]
    target_origin_id = var.origin["origin_id"]

    forwarded_values {
      query_string = var.default_cache_behavior["query_string"]
      headers = var.default_cache_behavior["headers"]
      cookies {
        forward = var.default_cache_behavior["forward"]
      }
    }

    viewer_protocol_policy = var.default_cache_behavior["viewer_protocol_policy"]
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = var.price_class

  restrictions {
    geo_restriction {
      restriction_type = var.restrictions["restriction_type"]
      locations        = var.restrictions["locations"]
    }
  }

  tags = var.global_tags

  viewer_certificate {
    cloudfront_default_certificate = var.viewer_certificate["is_cloudfront_default_certificate"]
    acm_certificate_arn = var.viewer_certificate["acm_certificate_arn"]
    ssl_support_method = var.viewer_certificate["ssl_support_method"]
  }
}