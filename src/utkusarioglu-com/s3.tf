# Stores tf state for the repo `workshop-aws-terraform`
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
