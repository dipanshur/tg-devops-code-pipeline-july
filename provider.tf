// we download Plugins

provider "aws" {
  region = "us-east-2"
  }


terraform {
  required_providers {
    aws = {
      version = "5.66.0"
    }
  }
}