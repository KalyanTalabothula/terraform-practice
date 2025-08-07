
# before creating route53, we need some ec2 Private IP address. 
# So, we need output of "aws_instance" "roboshop" so that we will create it.

# For that we have syntax of output like variable syntax only. like piping 

# output "ec2_instance_info" {
#     value  = aws_instance.roboshop
# }