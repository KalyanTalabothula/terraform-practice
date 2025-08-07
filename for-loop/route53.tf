# before creating route53, we need some ec2 Private IP address. 
# So, we need output of "aws_instance" "roboshop" so that we will create it.

# For that we have syntax of output like variable syntax only. like piping 

# 🔎 aws route 53 terraform,  syntax will be there for route 53 


resource "aws_route53_record" "www" {
  for_each = aws_instance.roboshop
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain_name}"  # "${mongodb}.${kalyanu.xyz}" 
  type    = "A"
  ttl     =  1 
  records = [each.value.private_ip]
}

# line 12 : dot . is static that is not variable -->interpolation, we need mongodb.kalyanu.xyz right
# So im getting the names from the ec2 instances tags right from there we are taking