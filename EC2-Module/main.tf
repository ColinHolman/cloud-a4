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

data "aws_vpc" "default_vpc" {
  default = true
}

# resource to create a public EC2 Instance
resource "aws_instance" "public" {
  ami           = var.amia
  instance_type = var.instance_type
  subnet_id     = var.pub_sub.id                # calls from VPC-Module
  vpc_security_group_ids = [ var.sec_group.id ] # calls from SG-Module
  tags          = merge(var.public_tags)
}

# resource to create a private EC2 Instance
resource "aws_instance" "private" {
  ami           = var.amia
  instance_type = var.instance_type
  subnet_id     = var.priv_sub.id               # calls from VPC-Module
  vpc_security_group_ids = [ var.sec_group.id ] # calls from SG-Module
  tags          = merge(var.private_tags)
}