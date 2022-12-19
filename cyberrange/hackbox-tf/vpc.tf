module "vpc" {
  source = "./modules/vpc"
  vpc_name                          = "${var.Project}-${var.env}-vpc"
  vpc_cidr                          = var.vpc_cidr
  public_cidr_blocks                = var.public_cidr_blocks
  public_availability_zones         = var.public_availability_zones
  private_cidr_blocks               = null
  private_availability_zones        = null
  enable_dns_hostnames              = true
  enable_dns_support                = true
  assign_generated_ipv6_cidr_block  = false
  enable_nat                        = false
  tags                              = local.common_tags
}