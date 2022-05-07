resource "aws_s3_bucket_policy" "static_content" {
  provider = aws.us_west_2
  bucket   = aws_s3_bucket.static_content.bucket
  policy   = data.aws_iam_policy_document.static_content_public_read.json
}
