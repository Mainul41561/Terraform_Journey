terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }
  backend "s3" {
    bucket         = "tfstate-s3-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "tfstate-s3-table"
  }
}