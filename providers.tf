terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.11.0"
    }
  }
}

provider "aws" {
  region                   = "eu-central-1"
}

provider "aws" {
  alias = "west_2"
  region                   = "us-west-2"
}
