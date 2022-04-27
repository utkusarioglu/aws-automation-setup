# Stores tf state for the repo `workshop-aws-terraform`
resource "aws_s3_bucket" "ws_aws_tf_state" {
  bucket = "ws-aws-terraform-state"
  tags = local.default_tags
}

resource "aws_s3_bucket_versioning" "ws_aws_tf_state" {
  bucket = aws_s3_bucket.ws_aws_tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "ws_aws_tf_state" {
  bucket = aws_s3_bucket.ws_aws_tf_state.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
