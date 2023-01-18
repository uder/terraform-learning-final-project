resource "aws_security_group" "allow_http" {
  # checkov:skip=CKV_AWS_260: HTTP is required by task

  name        = "${var.name_prefix}-sg-allow-http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from any"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.allow_client_cidr] # tfsec:ignore:aws-ec2-no-public-ingress-sgr Public access is required by task
  }

  egress {
    description = "Allow any outbound trafic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # tfsec:ignore:aws-ec2-no-public-egress-sgr Public access is required by task
  }

  tags = {
    Name = "${var.name_prefix}-sg-allow-http"
  }
}