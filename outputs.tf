output "id" {
  value = aws_cloudfront_distribution.default.id
  description = "distribution id"
}

output "arn" {
  value = aws_cloudfront_distribution.default.arn
  description = "distribution arn"
}

output "hosted_zone_id" {
  value = aws_cloudfront_distribution.default.hosted_zone_id
  description = "distribution arn"
}
