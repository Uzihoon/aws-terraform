provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = "ap-northeast-2"
}

## aws provider 후에 backend 설정을해줘야 한다.
terraform {
  backend "s3" {
    bucket         = "tfs-uzihoon-lambda-project"
    dynamodb_table = "tfl-uzihoon-lambda-project"
    region         = "ap-northeast-2"
    key            = "global/serverless/terraform.tfstate"
    encrypt        = true
  }
}
