resource "aws_cloudfront_origin_access_control" "default" {
  count = var.origin_access_control != null ? 1 : 0
  name                              = var.origin_access_control["name"]
  origin_access_control_origin_type = var.origin_access_control["origin_type"]
  signing_behavior                  = var.origin_access_control["signing_behavior"]
  signing_protocol                  = var.origin_access_control["signing_protocol"]
}