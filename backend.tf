terraform {
  backend "s3" {
    bucket = "tg-devops-9am-terraform-july-state"
    key    = "devops-0930/terraform.tfstate"
    region = "us-east-2"

  }
}