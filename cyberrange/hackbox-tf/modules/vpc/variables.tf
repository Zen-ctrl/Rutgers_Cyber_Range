variable "vpc_name" {
    description = "Name of the VPC"
    type = string
    default = null
}

variable "vpc_cidr" {
    description = "CIDR Block of the VPC"
    type = string
    default = null
}

variable "enable_dns_hostnames" {
    description = "Whether to enable DNS hostnames inside the VPC"
    type = bool
    default = false
}

variable "enable_dns_support" {
    description = "Whether to enable DNS Support inside the VPC"
    type = bool
    default = false
}

variable "assign_generated_ipv6_cidr_block" {
    description = "Whether to enable ipv6 inside the VPC"
    type = bool
    default = false
}

variable "tags" {
    description = "Resource tagging for all the resources created under VPC module"
    type = any
    default = {}
}

variable "public_cidr_blocks" {
    description = "CIDR Blocks for the public subnets"
    type = list
    default = null
}

variable "public_availability_zones" {
    description = "AZs for the public subnets"
    type = list
    default = null
}

variable "private_cidr_blocks" {
    description = "CIDR Blocks for the public subnets"
    type = list
    default = null
}

variable "private_availability_zones" {
    description = "AZs for the private subnets"
    type = list
    default = null
}

variable "enable_nat" {
    description = "Whether to enable NAT gateway for the private subnets to be associated with NAT route"
    type = bool
    default = true
}