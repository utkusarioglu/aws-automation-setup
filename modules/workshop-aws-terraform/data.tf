data "aws_iam_policy_document" "workshop_aws_terraform_gh_actions" {
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
      values   = ["repo:utkusarioglu/aws-terraform-workshop:*"]
    }
  }
}
