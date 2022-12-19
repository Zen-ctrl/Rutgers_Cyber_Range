variable "rules" {
  description = "Map detail values for creating the security group rules"
  type = any
  default = {}
}

variable "security_group_id" {
  description = "Security Group ID for the rules to be implemented"
  type = any
  default = null
}