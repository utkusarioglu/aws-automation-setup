resource "aws_iam_policy_attachment" "ws_aws_terraform_s3_policy" {
  name       = "ws-aws-terraform-s3-policy"
  policy_arn = aws_iam_policy.ws_aws_terraform_s3_policy.arn
  roles = [
    aws_iam_role.workshop_aws_terraform_gh_actions.name
  ]
}

resource "aws_iam_policy_attachment" "ws_aws_terraform_dynamodb_policy" {
  name       = "ws-aws-terraform-dynamodb-policy"
  policy_arn = aws_iam_policy.ws_aws_terraform_dynamodb_policy.arn
  roles = [
    aws_iam_role.workshop_aws_terraform_gh_actions.name
  ]
}

resource "aws_iam_policy_attachment" "ws_aws_tf_vpc_policy" {
  name = "ws-aws-tf-vpc-policy"
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
  roles = [
    aws_iam_role.workshop_aws_terraform_gh_actions.name
  ]
}
