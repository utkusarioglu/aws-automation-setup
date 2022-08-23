output "iam_role_gh_actions_arn" {
  value = aws_iam_role.gh_actions.arn
}

output "s3_static_content_arn" {
  value = aws_s3_bucket.main_static_content.arn
}

output "main_static_content_website_endpoint" {
  value = data.aws_s3_bucket.main_static_content_website_endpoint.website_endpoint
}
