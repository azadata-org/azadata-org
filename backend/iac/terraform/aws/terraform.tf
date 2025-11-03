terraform {
  backend "s3" {
    key          = "azadata"
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}
