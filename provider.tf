terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }

  # backend "remote" {
  #   organization = "tf-basics"

  #   workspaces {
  #     name = "tf-basics"
  #   }
  # }
}

provider "aws" {}
