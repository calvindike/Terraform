terraform {
  backend "s3" {
    bucket = "testingclass45"
    key    = "testing/terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.52.0"
    }
  }
  required_version = ">= 1.1.8"
}

provider "aws" {
  region = "us-east-1"
}
