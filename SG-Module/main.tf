terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.2"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "holmanco"

    workspaces {
      name = "cloud-a4"
    }
  }
}

# using AWS as the cloud provider
provider "aws" {
  region = var.aws_region
}


# created security group that allows SSH and HTTP
resource "aws_security_group" "SG-EC2-Server" {
  name = "Webserver"
  description = "allow SSH and HTTP protocols"
  vpc_id = var.new_vpc.id          # calls from VPC-Module
  
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "allow SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = "allow HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }

  egress {
    description = "allow out all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "sg_ec2" {
  value = aws_security_group.SG-EC2-Server  
}