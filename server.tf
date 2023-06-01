terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-west-2"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-03c7c1f17ee073747"
  instance_type = "t2.micro"
  key_name = "saurav-pub"

  tags = {
    Name = "Raman-DevOps-batch-server"
    env = "Production"
    owner = "Raman Khanna"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

