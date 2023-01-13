variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "tags" {
  description = "Common projects tags"
  type        = map(any)
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
    error_message = "Have to be a valid CIDR"
  }
}

variable "aws_subnets_number" {
  description = "Number of subnets in AWS VPC"
  type        = number
  default     = 3

  validation {
    condition     = var.aws_subnets_number <= 3
    error_message = "Number of AZ have to be 3 or less"
  }
}

variable "aws_az_letters" {
  description = "AWS availablility zone letters"
  type        = list(string)
  default     = ["a", "b", "c"]
}

variable "private_subnets" {
  description = "AWS private subnets CIDRs"
  type        = list(string)
  default = [
    "10.0.0.0/24",
    "10.0.1.0/24",
    "10.0.2.0/24"
  ]
}

variable "public_subnets" {
  description = "AWS private subnets CIDRs"
  type        = list(string)
  default = [
    "10.0.10.0/24",
    "10.0.11.0/24",
    "10.0.12.0/24"
  ]
}
