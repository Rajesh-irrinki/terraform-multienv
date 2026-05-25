terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>6.0"
    }
  }

  backend "s3" {
    bucket = "rajesh-terraform-remote-statefile"
    key = "terraform-workspace.tfstate"
    encrypt = true
    use_lockfile = true
    region = "us-east-1"
  }
}