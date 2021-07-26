resource "aws_instance" "sample" {
  ami                = "ami-074df373d6bafa625"
  instance_type      = "t3.micro"
  tags               = {
    Name             = "first"
  }
}

provider "aws" {
  region="us-east-1"
}

//to store in s3 bucket

terraform {
  backend "s3" {
    bucket           = "terraform-rdevops"
    key              = "sample/terraform.tfstate"
    region           = "us-east-1"
    dynamodb_table   = "terraform"
  }
}