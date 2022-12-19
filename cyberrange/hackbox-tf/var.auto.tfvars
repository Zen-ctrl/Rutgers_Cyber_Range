env            = "live"
Owner          = "Rutgers-ADM"
Project        = "hackerbox"
main_region    = "us-east-1"

# VPC Configs
vpc_cidr                    = "10.10.0.0/16"
public_cidr_blocks          = ["10.10.0.0/24", "10.10.1.0/24"]
public_availability_zones   = [ "us-east-1a", "us-east-1b"]
# private_cidr_blocks         = ["10.10.2.0/24", "10.10.3.0/24"]
# private_availability_zones  = [ "us-east-1a", "us-east-1b"]

# EC2
ec2-ami           = "ami-0b0ea68c435eb488d"
ec2-instance_type = "t3a.small"
ec2-volume_size   = 40
