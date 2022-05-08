resource "aws_iam_policy_attachment" "state_store" {
  provider   = aws.eu_central_1
  name       = "utkusarioglu-com-state-store"
  policy_arn = aws_iam_policy.state_store.arn
  roles = [
    aws_iam_role.gh_actions.name
  ]
}

resource "aws_iam_policy_attachment" "state_lock" {
  provider   = aws.eu_central_1
  name       = "utkusarioglu-com-state-lock"
  policy_arn = aws_iam_policy.state_lock.arn
  roles = [
    aws_iam_role.gh_actions.name
  ]
}

resource "aws_iam_policy_attachment" "static_content_write" {
  provider   = aws.us_west_2
  name       = "utkusarioglu-com-static-content-write"
  policy_arn = aws_iam_policy.static_content_write.arn
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
