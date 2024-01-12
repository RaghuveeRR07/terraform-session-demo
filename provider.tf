terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }

#   backend "remote" {
#     organization = var.organization

#     workspaces {
#       name = var.workspace
#     }
#   }
}

provider "aws" {}
