output "id" {
  value = aws_cloudfront_distribution.default.id
  description = "distribution id"
}

output "arn" {
  value = aws_cloudfront_distribution.default.arn
  description = "distribution arn"
}
