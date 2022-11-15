terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.11.0"
    }
  }
  backend "s3" {
    bucket                  = "utkusarioglu-aws-automation-setup-state"
    key                     = "terraform.tfstate"
    region                  = "eu-central-1"
    dynamodb_table          = "utkusarioglu-aws-automation-setup-lock"
    shared_credentials_file = "./.secrets/aws/credentials"
    profile                 = "aws-automation-setup"
  }
}

provider "aws" {
  region                   = "eu-central-1"
  shared_config_files      = ["./.secrets/aws/config"]
  shared_credentials_files = ["./.secrets/aws/credentials"]
  profile                  = "aws-automation-setup"
}


provider "aws" {
  alias                    = "eu_central_1"
  region                   = "eu-central-1"
  shared_config_files      = ["./.secrets/aws/config"]
  shared_credentials_files = ["./.secrets/aws/credentials"]
  profile                  = "aws-automation-setup"
}

provider "aws" {
  alias                    = "us_west_2"
  region                   = "us-west-2"
  shared_config_files      = ["./.secrets/aws/config"]
  shared_credentials_files = ["./.secrets/aws/credentials"]
  profile                  = "aws-automation-setup"
}

provider "aws" {
  alias                    = "us_east_1"
  region                   = "us-east-1"
  shared_config_files      = ["./.secrets/aws/config"]
  shared_credentials_files = ["./.secrets/aws/credentials"]
  profile                  = "aws-automation-setup"
}
