resource "aws_lb" "alb" {
  # checkov:skip=CKV_AWS_91: Access log is not needed for test env
  # checkov:skip=CKV2_AWS_20: HTTP is required by task
  # checkov:skip=CKV2_AWS_28: WAF is not required for test env

  name               = "${var.name_prefix}-alb"
  internal           = false # tfsec:ignore:aws-elb-alb-not-public
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = var.private_subnet_ids

  enable_deletion_protection = true
  drop_invalid_header_fields = true

  #   access_logs {
  #     bucket  = aws_s3_bucket.lb_logs.bucket
  #     prefix  = "test-lb"
  #     enabled = true
  #   }

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "www" {
  # checkov:skip=CKV_AWS_2: HTTP is required by task
  # checkov:skip=CKV_AWS_103: HTTP is required by task

  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP" # tfsec:ignore:aws-elb-http-not-used HTTP is required by task

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.www-servers.arn
  }
}
