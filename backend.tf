terraform {
  backend "s3" {
    bucket = "terraform-tfstate-bucket-01122024"
    key    = "april2025/terraform/infra.tfstate"
    region = "eu-west-2"
  }
}


# https://developer.hashicorp.com/terraform/language/backend/s3