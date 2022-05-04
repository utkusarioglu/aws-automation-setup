# State store
resource "aws_s3_bucket" "state_store" {
  bucket = "utkusarioglu-com-state-store"
  tags   = local.default_tags
}

resource "aws_s3_bucket_versioning" "state_store" {
  bucket = aws_s3_bucket.state_store.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state_store" {
  bucket = aws_s3_bucket.state_store.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Static content bucket
# Note that this one doesn't use the default provider
resource "aws_s3_bucket" "static_content" {
  provider = aws.west_2
  bucket = "utkusarioglu-com-static-content"
}

resource "aws_s3_bucket_website_configureation" "static_content" {
  provider = aws.west_2
  bucket = aws_s3_bucket.static_content.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    suffix = "error.html"
  }
}
