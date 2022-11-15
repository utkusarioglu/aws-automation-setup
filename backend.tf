terraform {
  backend "s3" {
    bucket                  = "utkusarioglu-aws-automation-setup-state"
    key                     = "terraform.tfstate"
    region                  = "eu-central-1"
    dynamodb_table          = "utkusarioglu-aws-automation-setup-lock"
    shared_credentials_file = "./.secrets/aws/credentials"
    profile                 = "aws-automation-setup"
  }
}
