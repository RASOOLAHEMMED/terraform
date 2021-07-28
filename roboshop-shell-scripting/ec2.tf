//resource "aws_spot_instance_request" "cheap_worker" {
//  count                       = length(var.COMPONENTS)
//  ami                         = "ami-074df373d6bafa625"
//  spot_price                  = "0.0031"
//  instance_type               = "t3.micro"
//  wait_for_fulfillment        = true
//
//  tags                        = {
//    Name                      = element(var.COMPONENTS, count.index)
//  }
//}

resource "aws_instance" "sample" {
  count                       = local.LENGTH
  ami                         = "ami-074df373d6bafa625"
  instance_type               = "t3.micro"
  vpc_security_group_ids      = ["sg-0db10ae5ed60c9988"]
  tags                        = {
    Name                      = element(var.COMPONENTS, count.index )
  }
}

resource "aws_route53_record" "records" {
  count                         = local.LENGTH
  name                          = element(var.COMPONENTS, count.index )
  type                          = "A"
  zone_id                       = "Z00947631JDBITKOLUVH1"
  ttl                           = 300
  records                       = [element(aws_instance.sample.*.private_ip, count.index )]
}


//to connect and run the shell scripting commands

resource "null_resource" "run-shell-scripting" {
  depends_on                  = [aws_route53_record.records]
  count                       = local.LENGTH
  provisioner "remote-exec" {
    connection {
      host                    = element(aws_instance.sample.*.public_ip, count.index)
      user                    = "centos"
      password                = "DevOps321"
    }
      inline                   = [
      "cd /home/centos",
      "git clone https://github.com/RASOOLAHEMMED/Shell-scripting_R.git",
      "cd Shell-scripting_R/Roboshop",
      "sudo make ${element(var.COMPONENTS, count.index)}"

    ]
  }
}

locals {
  LENGTH                      = length(var.COMPONENTS)
}