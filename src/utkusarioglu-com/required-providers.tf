terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.11.0"
      configuration_aliases = [
        aws.eu_central_1,
        aws.us_west_2,
        aws.us_east_1
      ]
    }
  }
}
