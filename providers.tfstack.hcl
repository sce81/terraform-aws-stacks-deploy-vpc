required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 5.72.1"
  }
}

provider "aws" "configurations" {
  for_each = var.regions

  config {
    region = each.value

    assume_role_with_web_identity {
      role_arn           = var.role_arn
      web_identity_token = var.identity_token
    }

    default_tags {
    tags = {
      env       = var.env_name
      terraform = "true"
      terraform_stacks = "true"
    }
  }
  }
}
