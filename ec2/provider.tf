
# 🔍  terraform aws use provider 

# 6.7.0 don't take current version, it might has any deffects so always try to take 2-3 versions backm means those are stable. that means even though already fixied the defects and created new version as well. and don't take beta versions as well, it is also like defected only. 

# Provider okkati este saripotumda, Terraform aws ni authnticate avvali kada. miru provider echhesi connect avvamante yela .... So we need to give provider & Authentication also. 

# Authentication is also done, just go to Gitbash give command: aws configure
# it will core automatically if you configured, if not now give that keys. 

# now go to terraform-practice and give command: terraform init
# Output ela vastumdhi ( Terraform has been successfully initialized! ) 
# ante intialize chestunnam, so adi aws ki sambamchina provider ni install chestumdhi ani. 
# Succesfully instalized, Meee provider configuration check chesukoni, Internet lopaki velli e provider.exe anedhi techhukumtumdhi. that's it.

# Windows laptop --> Install terraform --> downloaded .exe --> environment variables lo path mention chestam --> aws credentials Bash lo mention chestam.

# and .terraform.lock.hcl lo mee versions ni mention chestumdhi. 

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
}


