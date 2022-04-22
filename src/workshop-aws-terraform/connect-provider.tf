resource "aws_iam_openid_connect_provider" "githubOidc" {
  url             = "https://token.actions.githubusercontent.com"
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"] # github
  client_id_list = [
    "sts.amazonaws.com"
  ]
}
