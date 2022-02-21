terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }
  }
}

provider "aws" {
  region                   = "eu-central-1"
  profile                  = "tty8747"
  shared_credentials_files = ["~/.aws/credentials"]
}
