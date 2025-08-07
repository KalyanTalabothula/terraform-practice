

resource "aws_instance" "roboshop" {
  #count = 4        # create four similar EC2 instances
  #for_each = var.instances
  for_each = toset(var.instances) # it will list to map
  ami           = var.ami_id  
  instance_type = "t3.micro"
  vpc_security_group_ids = [  aws_security_group.allow_all.id  ]
  
  tags = {                                 # tags expected map vaules
    Name = each.key
  }  
}


resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"     
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

   egress {
    from_port        = 0 
    to_port          = 0
    protocol         = "-1"     
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags     # tags expected map vaules
}



