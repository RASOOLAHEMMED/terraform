resource "aws_instance" "sample" {
  count              = 2
  ami                = "ami-074df373d6bafa625"
  instance_type      = "t3.micro"
  vpc_security_group_ids = [var.SG_ID]

  tags               = {
    Name             = "HelloWorld-module-${count.index}"
  }
}

variable "SG_ID" {}

//print the privateip

output "PRIVATE_IP" {
  value =aws_instance.sample.*.private_ip
}
