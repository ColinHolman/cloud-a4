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

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
  default     = "t2.micro"
  
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

variable "new_vpc" {}