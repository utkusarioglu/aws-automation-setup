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
