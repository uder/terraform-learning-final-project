locals {
  name_prefix = "terraform-learning"
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

  name = "${local.name_prefix}-vpc"
  cidr = var.vpc_cidr

  azs             = local.azs
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets

  enable_nat_gateway = true

  tags = var.tags
}
