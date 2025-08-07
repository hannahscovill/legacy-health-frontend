output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.legacy_frontend.bucket
}

output "cloudfront_distribution_id" {
  description = "CloudFront Distribution ID"
  value       = aws_cloudfront_distribution.legacy_frontend.id
}

output "cloudfront_domain_name" {
  description = "CloudFront Distribution domain name"
  value       = aws_cloudfront_distribution.legacy_frontend.domain_name
}

output "bucket_name" {
  value = aws_s3_bucket.legacy_frontend.id
}