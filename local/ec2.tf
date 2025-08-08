

resource "aws_instance" "roboshop" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [  aws_security_group.allow_all.id  ]
  
  tags = {
    Name = "HelloWorld"
  }
}
