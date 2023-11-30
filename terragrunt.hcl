locals {
  aws_region          = "us-east-1"
  env                 = "production"
  backend_bucket_name = "clcm3404-group1-game-terraform-state"
  administrator       = "z.fu177@mybvc.ca"
}


inputs = {
  additional_tags = {
    Environment   = local.env
    Administrator = local.administrator
    Terraform     = true
    Service       = "clcm3404-group1-game"
  }
}


generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_region}"
  profile = "bvc"
}
EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket  = "${local.backend_bucket_name}"
    key     = "${local.env}/${path_relative_to_include()}/terraform.tfstate"
    region  = "${local.aws_region}"
    encrypt = true
    s3_bucket_tags = {
      "Administrator" = "${local.administrator}"
      "Environment"   = "${local.env}"
      "Terraform"     = "true"
    }
  }
}
