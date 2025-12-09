
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

# if we mentioned here our AWS credentials, then we run our github account sends continuous emails because our credentials are leaked, it is available in Github account, anyone can see our aws credentials, that's the reason we are not mentioning here and giving before in gitBash by using aws configure command. 