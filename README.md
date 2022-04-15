# cloud-a4
Workspace for Assignment 4 for Cloud Technologies


Each module is in a sub folder of its own with the root module being in the main.tf file.

The root terraform file will call on each module to create a VPC, then Security Group, then two EC2 instances calling on
each module for required information.

This was all done witth Terraform cloud and no backend file was created.