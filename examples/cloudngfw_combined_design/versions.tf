terraform {
  required_version = ">= 1.5.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.17"
    }
    cloudngfwaws = {
      source  = "PaloAltoNetworks/cloudngfwaws"
      version = "2.0.6"
    }
    time = {
      source  = "hashicorp/time"
      version = "0.11.1"
    }
  }
}

provider "aws" {
  region = var.region
}

locals {
  provider = coalesce(var.provider_account, data.aws_caller_identity.current.account_id)
}

provider "cloudngfwaws" {
  region    = var.region
  host      = "api.${var.region}.aws.cloudngfw.paloaltonetworks.com"
  lfa_arn   = "arn:aws:iam::${local.provider}:role/${var.provider_role}"
  lra_arn   = "arn:aws:iam::${local.provider}:role/${var.provider_role}"
  sync_mode = true
}

provider "time" {}