locals {
  azs = [for i in range(var.aws_subnets_number) :
    "${var.aws_region}${var.aws_az_letters[i]}"
  ]
  private_subnets = [for i in range(var.aws_subnets_number) :
    "${var.private_subnets[i]}"
  ]
  public_subnets = [for i in range(var.aws_subnets_number) :
    "${var.public_subnets[i]}"
  ]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = "${var.name_prefix}-vpc"
  cidr = var.vpc_cidr

  azs                     = local.azs
  private_subnets         = local.private_subnets
  public_subnets          = local.public_subnets
  map_public_ip_on_launch = false

  enable_nat_gateway = true
  single_nat_gateway = true

  manage_default_security_group  = true
  default_security_group_ingress = []
  default_security_group_egress  = []
}
