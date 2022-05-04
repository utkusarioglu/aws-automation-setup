module "budget" {
  source       = "./src/budget"
  budget_email = var.BUDGET_EMAIL
}

module "workshop_aws_terraform" {
  source         = "./src/workshop-aws-terraform"
  inherited_tags = local.default_tags
  github_oidc_arn = aws_iam_openid_connect_provider.github_oidc.arn
}

output "workshop_aws_terraform" {
  value = module.workshop_aws_terraform
}

module "utkusarioglu_com" {
  source         = "./src/utkusarioglu-com"
  inherited_tags = local.default_tags
  github_oidc_arn = aws_iam_openid_connect_provider.github_oidc.arn
}

output "utkusarioglu_com" {
  value = module.utkusarioglu_com
}
