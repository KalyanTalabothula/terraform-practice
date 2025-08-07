
# 🔍 terraform aws security group

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group 

# E document refer chesukuntu anni resources Terraform tho create chesukuntam.
# manam console chesedhi ekkada script dhwara chestunna ante.



resource "aws_instance" "roboshop" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"

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
    protocol         = "-1"     # if you selsect -1 that means allow all inbond 
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

   egress {
    from_port        = 0 
    to_port          = 0
    protocol         = "-1"     # if you selsect -1 that means allow all inbond 
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_all"
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

