# Static content bucket
# Note that this one doesn't use the default provider
resource "aws_s3_bucket" "static_content" {
  provider = aws.us_west_2
  bucket   = "utkusarioglu-com-static-content"
}

resource "aws_s3_bucket_website_configuration" "static_content" {
  provider = aws.us_west_2
  bucket   = aws_s3_bucket.static_content.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_cors_configuration" "static_content" {
  provider = aws.us_west_2
  bucket   = aws_s3_bucket.static_content.bucket

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET"]
    allowed_origins = ["https://www.${local.domain_name}"]
    max_age_seconds = 3000
  }
}
