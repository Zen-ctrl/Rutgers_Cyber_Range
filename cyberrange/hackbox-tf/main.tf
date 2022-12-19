terraform {
  required_providers {
    aws = {
      version = "~> 4.46.0"
    }
  }
}

# Creating a resource reference point to be used by Terraform components 
data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}
data "aws_region" "current" {}


