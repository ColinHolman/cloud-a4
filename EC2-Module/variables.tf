variable "amia" {
  description = "Amazon Machine Image"
  default = "ami-0c02fb55956c7d316"
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

variable "private_tags" {
  description = "Project tags to be used to track costs."
  type        = map(string)
  default = {
    Name       = "Private Subnet"
    Owner      = "Colin Holman"
    Purpose    = "Lab4 Assignment"
  }
}

variable "public_tags" {
  description = "Project tags to be used to track costs."
  type        = map(string)
  default = {
    Name       = "Public Subnet"
    Owner      = "Colin Holman"
    Purpose    = "Lab4 Assignment"
  }
}

variable "pub_sub" {}

variable "priv_sub" {}

variable "sec_group" {}