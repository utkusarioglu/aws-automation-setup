module "workshop_aws_terraform" {
  source = "./src/workshop-aws-terraform"
}

output "workshop_aws_terraform" {
  value = module.workshop_aws_terraform
}
