data "aws_ami" "latest" {
  most_recent = true
  owners      = [var.ami_owner_account_id]

  filter {
    name   = "name"
    values = ["terraform-learning-golden-ami-apache"]
  }
}

resource "aws_launch_configuration" "www" { # tfsec:ignore:aws-ec2-enable-launch-config-at-rest-encryption Public access is required by task
  # checkov:skip=CKV_AWS_8 EBS encription is not required for test env
  name_prefix     = "${var.name_prefix}-launch-config"
  image_id        = data.aws_ami.latest.id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.asg_instance.id, var.alb_security_group_id]

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  lifecycle {
    create_before_destroy = true
  }
}
