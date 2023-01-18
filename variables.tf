variable "name_prefix" {
  description = "Name prefix for the project"
  type        = string
  default     = "terraform-learning"
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "ami_owner_account_id" {
  description = "Account ID owns AMI"
  type        = string
  default     = "565143587686"
}

variable "default_tags" {
  description = "Common projects tags"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "test"
    Learning    = "true"
  }
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "Have to be a valid CIDR."
  }
}

variable "instance_type" {
  description = "AWS Instance type"
  type        = string
  default     = "t2.micro"
}

variable "asg_max_size" {
  description = "Autoscaler group max size"
  type        = number
  default     = 6
}

variable "asg_min_size" {
  description = "Autoscaler group min size"
  type        = number
  default     = 3
}

variable "asg_desired_size" {
  description = "Autoscaler group min size"
  type        = number
  default     = 3
}

variable "aws_subnets_number" {
  description = "Number of subnets in AWS VPC"
  type        = number
  default     = 3

  validation {
    condition     = var.aws_subnets_number <= 3
    error_message = "Number of AZ have to be 3 or less."
  }
}

variable "allow_client_cidr" {
  description = "Network with trusted clients"
  type        = string
  default     = "0.0.0.0/0"
}