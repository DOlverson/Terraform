terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-0cdc6318a62374402"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0b31f26bda0c642bd"]
  subnet_id              = "subnet-0833826a250dd0ee4"
  key_name               = "Proton Kube Key"

  tags = {
    Name = "EC2Example"
  }
}
