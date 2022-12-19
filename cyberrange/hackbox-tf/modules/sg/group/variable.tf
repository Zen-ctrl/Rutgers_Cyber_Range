variable "name" {
  description = "Name of the security group"
  type = string
  default = null
}

variable "name_prefix" {
  description = "Name Prefix of the security group"
  type = string
  default = null
}

variable "description" {
  description = "Description of the security group"
  type = string
  default = null
}

variable "revoke_rules_on_delete" {
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first"
  type = bool
  default = false
}

variable "vpc_id" {
  description = "VPC ID for the security group to be created on"
  type = string
  default = null
}

variable "tags" {
  description = "Resource tags for the Security group"
  type = any
  default = null
}