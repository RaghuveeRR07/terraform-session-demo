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

provider "aws" {
  access_key = "AKIAZOO6PDP7OQVPRJMU"
  secret_key = "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"
  region     = "ap-south-1"
}
