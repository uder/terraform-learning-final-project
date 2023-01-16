provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.default_tags
  }
}

module "network" {
  source = "./modules/network"

  name_prefix        = var.name_prefix
  aws_region         = var.aws_region
  vpc_cidr           = var.vpc_cidr
  aws_subnets_number = var.aws_subnets_number
}

module "autosacler_group" {
  source = "./modules/autoscaler_group"

  name_prefix = var.name_prefix
  asg_params = {
    max_size           = var.asg_max_size
    min_size           = var.asg_min_size
    desired_size       = var.asg_desired_size
    private_subnet_ids = module.network.private_subnet_ids
  }
  instance_type        = var.instance_type
  ami_owner_account_id = var.ami_owner_account_id
  default_tags         = var.default_tags
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}