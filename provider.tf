// we download Plugins

provider "aws" {
  region = "us-east-2"
  assume_role {
    role_arn     = "arn:aws:iam::211125425717:role/custom-tg-devops-0930-terraform-role-2"
    session_name = "devops-0930"
  }

}

terraform {
  required_providers {
    aws = {
      version = "5.66.0"
    }
  }
}