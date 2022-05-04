module "budget" {
  source       = "./src/budget"
  budget_email = var.BUDGET_EMAIL
}

module "workshop_aws_terraform" {
  source         = "./src/workshop-aws-terraform"
  inherited_tags = local.default_tags
}

output "workshop_aws_terraform" {
  value = module.workshop_aws_terraform
}

module "utkusarioglu_com" {
  source         = "./src/utkusarioglu-com"
  inherited_tags = local.default_tags
}

output "utkusarioglu_com" {
  value = module.utkusarioglu_com
}
