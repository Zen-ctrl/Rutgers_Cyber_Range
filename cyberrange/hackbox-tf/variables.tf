variable "Project" {
  description = "Name of the project"
  type = string
  default = ""
}

variable "env" {
  description = "Environment"
  type = string
  default = ""
}

variable "Owner" {
  description = "Owner this project"
  type = string
  default = ""
}

variable "main_region" {
  description = "Main region"
  type = string
  default = ""
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type = string
  default = ""
}

variable "public_cidr_blocks" {
  description = "Public Subnet CIDR blocks"
  type = list
  default = null
}

variable "public_availability_zones" {
  description = "Public Subnet AZs"
  type = list
  default = null
}

variable "private_cidr_blocks" {
  description = "Private Subnet CIDR blocks"
  type = list
  default = null
}

variable "private_availability_zones" {
  description = "Private Subnet AZs"
  type = list
  default = null
}

variable "ec2-ami" {
  description = "AMI ID of Instance"
  type = string
  default = null
}

variable "ec2-instance_type" {
  description = "Instance type of Instance"
  type = string
  default = null
}

variable "ec2-volume_size" {
  description = "Volume size of Instance root block"
  type = number
  default = null
}
