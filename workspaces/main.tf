resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
    vpc_security_group_ids = local.sg_id
    
  tags = {
    Name = "HelloWorld"
  }
}

 resource "aws_security_group" "allow_all" {
  name        = "allow-all-security-group"
  description = "Allow HTTP and SSH access"

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 0
    to_port     = 0
    protocol    =  "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-all"
  }
}