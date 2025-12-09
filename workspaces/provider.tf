
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"    # AWS Plugin version
    }
  }
}

provider "aws" {      
  # Configuration options 
  # provider "aws" { region = "us-east-1" }
  # Access key : Xsdfsdgadg
  # secret key : asdgfgafg
          # OR
  # Cloud Profile 
}
