terraform {
  required_providers {
    aws = {
      version = "~> 4.46.0"
    }
  }
}

resource "aws_security_group_rule" "this" {
  for_each                  = var.rules
  security_group_id         = try(var.security_group_id, null)
  type                      = lookup(each.value, "type", null)
  description               = lookup(each.value, "description", null)
  from_port                 = lookup(each.value, "from_port", null)
  to_port                   = lookup(each.value, "to_port", null)
  self                      = lookup(each.value, "self", null)
  protocol                  = lookup(each.value, "protocol", null)
  cidr_blocks               = lookup(each.value, "cidr_blocks", null)
  ipv6_cidr_blocks          = lookup(each.value, "ipv6_cidr_blocks", null)
  source_security_group_id  = lookup(each.value, "source_security_group_id", null)
}