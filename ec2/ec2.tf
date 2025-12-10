
# 🔍 terraform aws security group

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group 

# E document refer chesukuntu anni resources Terraform tho create chesukuntam.
# manam console chesedhi ekkada script dhwara chestunna ante.



resource "aws_instance" "roboshop" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  #vpc_security_group_ids = [  aws_security_group.allow_all.id  ]
  # aws_security_group --> ane resources vadukoni, andhulo --> allow_all --> ane perutho unna resouces loki velli --> id --> aa  security group (ID) tisuko ani meaning
  vpc_security_group_ids = local.sg_id
  # subnet_id - manam yeppudu evvala upto now, so it will take subnet default once like SG
  # key_name - edi kuda mana ki ledu mana instance, so that is optional not mandotary. 
  # these are enough to create ec2 instance. 
  
  tags = {
    Name = "HelloWorld"
  }
}



resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "allow all traffic"
  
  ingress {
    from_port        = 0 # if you need specific port like 80 ala kuda echhukovachhu, al echhi Protocal anedi TCP ani mention cheyali
    to_port          = 0
    protocol         = "-1"     # if you select -1 that means allow all inbond 
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

   egress {
    from_port        = 0 
    to_port          = 0
    protocol         = "-1"     # if you select -1 that means allow all inbond 
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    lifecycle {
      create_before_destroy = true
    }

  tags = {
    Name = "allow_all"  # Human-friendly label shown in AWS console
  }
}


# 💡 In short: Terraform talks to AWS directly via API using your saved credentials, so console login is optional — but the resource is still created.

# # Nenu Visual Studio Code (VSC) lo Terraform script rasanu. 
# Ee script dwara AWS lo resources create cheyali ani anukuntunna.

# Kaani, Terraform ki AWS lo panicheyyali ante, 
# **authentication** kavali – ante, AWS ki cheppali:
# "Ee person (Kalyan) naa permission tho naa account lo resource create chestunnadu."

# So, nenu AWS console lo vellanu, 
# **Access Key ID** and **Secret Access Key** create chesanu.

# Ee credentials ni nenu **AWS CLI** ki ichanu using `aws configure`.

# **AWS CLI ante communicator** – ante **translator** madhya lo unde:
# 👉 Terraform ni AWS tho connect cheyyadam lo help chesthadi.

# So, finally:
# - Terraform script rasanu
# - AWS CLI install chesanu
# - `aws configure` run chesi credentials ichanu
# - Ippudu Terraform AWS lo resources create cheyyagaladu!



# Security Group: `name` vs `tags.Name`

# This document provides a simple explanation of the difference between the `name` attribute and the `tags.Name` value in an AWS Security Group when using Terraform.

# ---

# ## 1. **`name`**

# * The actual Security Group name stored in AWS.
# * Used internally by AWS.
# * Must be **unique** within the VPC.
# * Example:

#   ```hcl
#   name = "allow_all"
#   ```

# ---

# ## 2. **`tags.Name`**

# * A **tag (label)** applied to the resource.
# * Shown in the AWS Console as the visible display name.
# * Used for:

#   * Searching
#   * Billing
#   * Organizing resources
#   * Automation (Glue, Lambda, EC2 filters, etc.)
 
# * Example:

#   ```hcl
#   tags = {
#     Name = "allow-all"
#   }
#   ```

# ---

# ## 🔑 Main Difference

# | `name`                 | `tags.Name`                         |
# | ---------------------- | ----------------------------------- |
# | Actual AWS SG name     | A tag/label for humans              |
# | Required by AWS        | Optional, But good to keep          |
# | Used by AWS internally | Shown in Console for easier viewing |

# ---

# ## 🧠 Why Use Both?

# * AWS **requires** `name` for the Security Group.
# * Teams use `tags.Name` because it's nicely visible in the AWS Console and helps with organizing and grouping resources.

# ---

# ## Summary

# * `name` = technical resource name
# * `tags.Name` = User‑friendly label/tag shown in the AWS UI

# ---


