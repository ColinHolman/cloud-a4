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

# Module to creat new VPC with Subnets
module "vpc" {
    source = "./VPC-Module"    
}

# module to create new Security Group that allows SSH and HTTP
module "sg" {
    source = "./SG-Module"
    new_vpc = module.vpc.new_vpc  
}

# module to create two EC2 instances, one private and one public
module "ec2" {
    source = "./EC2-Module"
    pub_sub = module.vpc.pub_sub
    priv_sub = module.vpc.priv_sub
    sec_group = module.sg.sg_ec2
}