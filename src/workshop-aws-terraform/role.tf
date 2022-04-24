data "aws_iam_policy_document" "workshop_aws_terraform_gh_actions" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github_oidc.arn]
    }
    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:utkusarioglu/workshop-aws-terraform:*"]
    }
  }
}

resource "aws_iam_role" "workshop_aws_terraform_gh_actions" {
  name               = "workshop-aws-terraform-gh-actions"
  assume_role_policy = data.aws_iam_policy_document.workshop_aws_terraform_gh_actions.json
}

output "workshop_aws_terraform_gh_actions_arn" {
  value = aws_iam_role.workshop_aws_terraform_gh_actions.arn
}
