data "aws_iam_policy_document" "gh_actions" {
  provider = aws.eu_central_1
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [var.github_oidc_arn]
    }
    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:utkusarioglu/utkusarioglu-com:*"]
    }
  }
}

data "aws_iam_policy_document" "main_static_content_public_read" {
  provider = aws.us_west_2
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.main_static_content.arn}/*",
    ]

    condition {
      test = "StringEquals"
      variable = "aws:Referer" 
      values = [var.referer_value]
    }
  }
}

data "aws_s3_bucket" "main_static_content_website_endpoint" {
  provider = aws.us_west_2
  bucket   = aws_s3_bucket.main_static_content.bucket
}
