terraform {
  required_providers {
    aws = {
      version = "~> 4.46.0"
    }
  }
}

resource "aws_security_group" "this" {
  name                    = try(var.name_prefix, null) == null ? try(var.name, null) : null
  name_prefix             = try(var.name_prefix, null) == null ? null : try(var.name_prefix, null)
  description             = try(var.description, null)
  revoke_rules_on_delete  = try(var.revoke_rules_on_delete, false)
  vpc_id                  = try(var.vpc_id, null)
  tags                    = try(var.tags, null)
}