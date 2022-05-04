resource "aws_iam_policy_attachment" "state_store" {
  name       = "utkusarioglu-com-state-store"
  policy_arn = aws_iam_policy.state_store.arn
  roles = [
    aws_iam_role.gh_actions.name
  ]
}

resource "aws_iam_policy_attachment" "state_lock" {
  name       = "utkusarioglu-com-state-lock"
  policy_arn = aws_iam_policy.state_lock.arn
  roles = [
    aws_iam_role.gh_actions.name
  ]
}

# resource "aws_iam_policy_attachment" "vpc" {
#   name       = "ws-aws-tf-vpc-policy"
#   policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
#   roles = [
#     aws_iam_role.gh_actions.name
#   ]
# }
