variable "amia" {
  description = "Amazon Machine Image"
  default = "ami-0c02fb55956c7d316"
}

variable "amiu" {
  description = "Ubuntu Machine Image"
  default = "ami-04505e74c0741db8d"
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

# variable "availability_zone" {
#   description = "availability zone in US EAST"
#   type = string
#   default = ""
  
# }

variable "instance_type" {
  description = "Type of instance"
  type        = string
  default     = "t2.micro"  
}

variable "instance_tenancy" {
  description = "instance tenancy"
  type        = string
  default     = "default"  
}

variable "cidr_block" {
  description = "CIDR block of VPC"
  type        = string
  default     = "10.0.0.0/16"  
}

variable "project_tags" {
  description = "Project tags to be used to track costs."
  type        = map(string)
  default = {
    Name       = "Cloud Infrastructure Formation"
    Owner      = "Colin Holman"
    Purpose    = "Lab4 Assignment"
    CostCenter = "0001"
  }
}

variable "main_vpc_cidr" {
  description = "privatee subnet"
  type = string
  default = "10.0.0.0/24"
}

variable "public_subnets" {
  description = "privatee subnet"
  type = string
  default = "10.0.0.128/26"
}

variable "private_subnets" {
  description = "private subnet"
  type = string
  default = "10.0.0.192/26"
}