terraform {
  required_version = ">= 1.5.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.17"
    }
    local = {
      version = "~> 2.4.0"
    }
  }
}

provider "aws" {
  region = var.region
}
