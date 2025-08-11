
resource "aws_instance" "roboshop" {
  ami           = var.ami_id  
  instance_type = var.instance_type
  vpc_security_group_ids = [  aws_security_group.allow_all.id  ]
  
  tags = var.ec2_tags    

    provisioner "local-exec" {
    command = "  ${self.private_ip} > inventory"   # <-- space lo echo
    on_failure = continue  # ignoring errors
  }

  provisioner "local-exec" {
    command = " echo 'inventory is destroyed' "   
    when = destroy  
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"     # <-- name of user
    password = "DevOps321"
    host     = self.public_ip    # < -- public only right, mana laptop numchi ite.. 
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
    ]
  }
  
  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl stop nginx",
    ]
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


#  self mean roboshop only, >private_ip means dani private-ip only, dhanini tisukoni velli inventory ane file create chesi dhanilo save chey ani meaning. 

# so IP-address vachhimdhi, ee ip address tho yemi chesukuntam, you can run ansible play books automatic gha. so terraform ni ansible ni integrate chesukoni..
# Terraform responsible vachhesi server ni create cheyatam varaske, an then once server create chesina taruwata miku ip address vachhimdhi ante,then you can handover this ip-address to Ansible. Appudu ansible aa server ki connect ayye a provisioning chestumdhi. public or private Ip whatever we want, we can give. 

# not only Ip address, manaki nachhina di run chesukovachhu. like Alarts pampimchatamu or yevariki ina info cheyatamu ala... 

# yenni local-exec aaina e vachhu, oka dhani taruwata okati execute avutumdhi.  

# ala ney failure behaviour kuda pettukovachhu, indhak amanam yemi chesamu, adi fail indhi kabatti malli adi first numdhi execute indhi... naku ala vaddu fail ite parledu anukunte on failure = continue ani pedate ipotumdhi. appudu malli recreate avvaadu


