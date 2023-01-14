locals {
  name_prefix = "terraform-learning"
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "AWS Instance type"
  type = string
  default = "t3.micro"  
}

source "amazon-ebs" "prototype" {
  ami_name      = "${local.name_prefix}-golden-ami-apache"
  instance_type = var.instance_type
  region        = var.aws_region

  source_ami = "ami-0ceecbb0f30a902a6"
  force_deregister = true

  ssh_username = "ec2-user"
}

build {
  sources = ["source.amazon-ebs.prototype"]

  provisioner "shell" {
    script = "scripts/setup.sh"
  }
}
