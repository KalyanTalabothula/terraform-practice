variable "ami_id" {
  type = string
  default = "ami-09c813fb71547fc4f"
  description = "AMI ID of info RHEL9"
}

variable "instance_type" {
    type = string           # type mandotory kadu, terraform chusukuntumdhi evvakapoyena 
    default = "t3.micro" 
    description = "AMI ID of info RHEL9" # Description mandotory kadu, just for understanding to US  
}

variable "ec2_tags" {
    type = map(string)
    default = {
        Name = "Roboshop"    # Always Capital "N"ame
        purpose = "variables-demo"
    }
}

variable "sg_name" {
  type = string
  default = "allow-all"
}

variable "sg_description" {
    type = string
    default = "allowing all ports from the internet"
}

variable "from_port" {
  type = number
  default = 0 
}

variable "to_port" {
  type = number
  default = 0 
}

variable "cidr_blocks" {
  type = list (string)  
  default = ["0.0.0.0/0"]        # list of string ani meaning, giving name in type
}

variable "sg_tags" {
    type = map (string)
    default = {
        Name = "allow-all"
    }
}

variable "environment" {
    #default = "dev"
    default = "prod"
}

variable "instances" {
  type = list(string)
  default = [  "mongodb", "redis", "mysql", "rabbitmq"  ]
}