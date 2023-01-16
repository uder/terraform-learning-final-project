variable "name_prefix" {
  description = "Name prefix for the project"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "VPC private subnets ids"
  type        = list(string)
}

variable "asg_id" {
  description = "AutoScaler Group ID"
  type        = string
}