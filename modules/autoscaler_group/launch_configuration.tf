data "aws_ami" "latest" {
  most_recent = true
  owners      = [var.ami_owner_account_id]

  filter {
    name   = "name"
    values = ["terraform-learning-golden-ami-apache"]
  }
}

resource "aws_launch_template" "launch_template" {
  name_prefix   = "${var.name_prefix}-launch-template"
  image_id      = data.aws_ami.latest.id
  instance_type = var.instance_type
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
}