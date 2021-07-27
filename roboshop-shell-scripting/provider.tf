provider "aws" {
  region             = "us-east-1"
}

terraform {
  backend "s3" {
    bucket           = "terraform-rdevops"
    key              = "roboshop/shellscripting/terraform.tfstate"
    region           = "us-east-1"
    dynamodb_table   = "terraform"
  }
}
