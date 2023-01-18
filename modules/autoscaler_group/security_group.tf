resource "aws_security_group" "asg_instance" {
  name        = "${var.name_prefix}-sg-asg-instance"
  description = "Allow HTTP inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow inbound from ALB"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [var.alb_security_group_id]
  }

  egress {
    description = "Allow any outbound trafic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # tfsec:ignore:aws-ec2-no-public-egress-sgr Public access is required by task
  }

  tags = {
    Name = "${var.name_prefix}-sg-asg-instance"
  }
}