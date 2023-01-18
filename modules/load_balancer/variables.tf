variable "name_prefix" {
  description = "Name prefix for the project"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnet_ids" {
  description = "VPC public subnets ids"
  type        = list(string)
}

variable "asg_id" {
  description = "AutoScaler Group ID"
  type        = string
}

variable "allow_client_cidr" {
  description = "Network with trusted clients"
  type        = string
}