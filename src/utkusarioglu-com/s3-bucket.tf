# State store
resource "aws_s3_bucket" "state_store" {
  provider = aws.eu_central_1
  bucket   = "utkusarioglu-com-state-store"
  tags     = local.default_tags
}

resource "aws_s3_bucket_versioning" "state_store" {
  bucket = aws_s3_bucket.state_store.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state_store" {
  provider = aws.eu_central_1
  bucket   = aws_s3_bucket.state_store.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

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

# Bare domain redirection bucket
resource "aws_s3_bucket" "bare_domain_redirect" {
  provider = aws.us_west_2
  bucket   = "utkusarioglu-com-bare-domain-redirect"
}

# TODO check if this works witout a policy attachment
resource "aws_s3_bucket_website_configuration" "bare_domain_redirect" {
  provider = aws.us_west_2
  bucket   = aws_s3_bucket.bare_domain_redirect.bucket
  redirect_all_requests_to {
    host_name = "www.${local.domain_name}"
    protocol  = "https"
  }
}
