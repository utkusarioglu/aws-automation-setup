resource "aws_iam_policy" "ws_aws_terraform_s3_policy" {
  name        = "ws-aws-terraform-s3-policy"
  path        = "/"
  description = "Allows minimal access for storing tf state in AWS S3"
  tags        = local.default_tags

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow",
        Resource = "arn:aws:s3:::ws-aws-terraform-state"
        Action   = "s3:ListBucket",
      },
      {
        Effect   = "Allow"
        Resource = "arn:aws:s3:::ws-aws-terraform-state/global/s3/terraform.tfstate"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
      },
    ]
  })
}

resource "aws_iam_policy" "ws_aws_terraform_dynamodb_policy" {
  name        = "ws-aws-terraform-dynamodb-policy"
  path        = "/"
  description = "Allows minimal DynamoDB access to store and query tf state lock"
  tags        = local.default_tags

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Resource = "arn:aws:dynamodb:*:*:table/ws-aws-terraform-gh-actions-locks"
        Action = [
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:DeleteItem"
        ]
      }
    ]
  })
}
