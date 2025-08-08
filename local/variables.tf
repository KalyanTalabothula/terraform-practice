variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "component" {
  default = "cart"
}

# ec2 name = cart
# ec2 name = roboshop-dev-cart
  

/* variable "final_name" {
  default = "${var.project}-${var.environment}-${var.component}"
}
 */

# oka Variable vere variables refer cheyaledu. 

variable "common_tags" {
  default = {
    Project   = "roboshop"
    Terraform = "true"
  }
}