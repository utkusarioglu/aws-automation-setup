# Stores lock for the repo state
resource "aws_dynamodb_table" "ws_aws_terraform_state_lock" {
  name         = "ws-aws-terraform-gh-actions-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  tags         = local.default_tags
  attribute {
    name = "LockID"
    type = "S"
  }
}
