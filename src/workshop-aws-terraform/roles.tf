resource "aws_iam_role" "workshop_aws_terraform_gh_actions" {
  name               = "workshop-aws-terraform-gh-actions"
  assume_role_policy = data.aws_iam_policy_document.workshop_aws_terraform_gh_actions.json
  tags = local.default_tags
}
