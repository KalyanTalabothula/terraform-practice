
# 🔍 terraform aws security group

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group 

# E document refer chesukuntu anni resources Terraform tho create chesukuntam.
# manam console chesedhi ekkada script dhwara chestunna ante.

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