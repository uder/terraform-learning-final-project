variable "name_prefix" {
  description = "Name prefix for the project"
  type        = string
}

variable "instance_type" {
  description = "AWS EC2 instance type"
  type        = string
}

variable "ami_owner_account_id" {
  description = "Account ID owns AMI"
  type        = string
  default     = "565143587686"
}

variable "asg_params" {
  description = "Contains AWS Autoscaling group parameters"
  type = object({
    min_size           = number
    max_size           = number
    desired_size       = number
    private_subnet_ids = list(string)
  })

  validation {
    condition     = length(var.asg_params.private_subnet_ids) >= 3
    error_message = "Number of private subnets have to be 3 or less."
  }

  validation {
    condition     = var.asg_params.min_size >= length(var.asg_params.private_subnet_ids)
    error_message = "ASG min size have to be greater or equal then number of private subnets"
  }

  validation {
    condition     = var.asg_params.max_size >= var.asg_params.min_size
    error_message = "ASG max size have to be greater or equal then min size"
  }

  validation {
    condition     = var.asg_params.desired_size >= var.asg_params.min_size
    error_message = "ASG desired size have to be greater or equal then min size"
  }

  validation {
    condition     = var.asg_params.desired_size <= var.asg_params.max_size
    error_message = "ASG desired size have to be less or equal then max size"
  }
}

variable "default_tags" {
  description = "Tags"
  type        = map(string)
}