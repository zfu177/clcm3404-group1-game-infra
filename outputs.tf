output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.s3_distribution.id
}

output "bucket_name" {
  value = aws_s3_bucket.website.id
}

output "iam_user_ssm_parameter_path" {
  value = aws_ssm_parameter.user_credentials.name
}
