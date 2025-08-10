
# Terraform – Create AWS S3 Bucket

This project demonstrates how to use **Terraform** to create and manage an **AWS S3 bucket**.  
It covers writing `.tf` configuration files, managing the **Terraform state (`.tfstate`)**, and following Infrastructure as Code (IaC) best practices.

---

## 📌 Prerequisites

Before you begin, ensure you have the following:

- **AWS Account** with programmatic access
- **Terraform** installed ([Install Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli))
- **AWS CLI** installed and configured with credentials (`aws configure`)
- Basic knowledge of Terraform commands

---

## 📂 Project Structure

```bash
terraform-s3-bucket/
├── main.tf              # Main Terraform configuration
├── variables.tf         # Input variables
├── outputs.tf           # Outputs from Terraform
├── terraform.tfvars     # Variable values (ignored in Git if sensitive)
├── provider.tf          # AWS provider configuration
└── README.md            # Documentation
