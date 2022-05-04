resource "aws_dynamodb_table" "state_lock" {
  name         = "utkusarioglu-com-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  tags         = local.default_tags
  attribute {
    name = "LockID"
    type = "S"
  }
}
