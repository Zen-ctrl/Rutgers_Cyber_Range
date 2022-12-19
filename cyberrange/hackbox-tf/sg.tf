module "sg_ec2" {
  source = "./modules/sg/group"
  depends_on = [
    module.vpc
  ]
  name_prefix = "${var.Project}-${var.env}-ec2"
  description = "SG for ${var.Project} ${var.env} EC2"
  revoke_rules_on_delete = true
  vpc_id = module.vpc.vpc_id
  tags = merge(
    { 
      "Name"    = "${var.Project}-${var.env}-ec2" 
      "Service" = "Security Group" 
    }, 
    local.common_tags
  )
}


module "sg_ec2-rules" {
  source = "./modules/sg/rules"
  depends_on = [
    module.sg_ec2
  ]
  security_group_id = module.sg_ec2.id
  rules = {
    rule01 = {
      type             = "ingress"
      description      = "https-443"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
    rule02 ={
      type             = "ingress"
      description      = "http-80"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
    rule03 ={
      type             = "ingress"
      description      = "ssh"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
    rule04 ={
      type             = "egress"
      description      = "https-443"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
    rule05 ={
      type             = "egress"
      description      = "http-80"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }
}