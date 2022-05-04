resource "aws_iam_role" "gh_actions" {
  name               = "utkusarioglu-com-gh-actions"
  assume_role_policy = data.aws_iam_policy_document.gh_actions.json
  tags               = local.default_tags
}
