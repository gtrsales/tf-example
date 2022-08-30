terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }
  # backend "http" {
  # }
}

provider "aws" {
  # Configuration options
}
