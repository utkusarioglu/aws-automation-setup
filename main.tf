module "budget" {
  source       = "./modules/budget"
  budget_email = var.BUDGET_EMAIL
}

module "workshop_aws_terraform" {
  source          = "./modules/workshop-aws-terraform"
  inherited_tags  = local.default_tags
  github_oidc_arn = aws_iam_openid_connect_provider.github_oidc.arn
}

output "workshop_aws_terraform" {
  value = module.workshop_aws_terraform
}

module "utkusarioglu_com" {
  source          = "./modules/utkusarioglu-com"
  inherited_tags  = local.default_tags
  github_oidc_arn = aws_iam_openid_connect_provider.github_oidc.arn
  referer_value   = var.REFERER_VALUE
  providers = {
    aws.eu_central_1 = aws.eu_central_1
    aws.us_west_2    = aws.us_west_2
    aws.us_east_1    = aws.us_east_1
  }
}
