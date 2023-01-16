resource "aws_lb_target_group" "www-servers" {
  name     = "${var.name_prefix}-www-srv"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 10
    matcher             = 200
    path                = "/index.html"
    protocol            = "HTTP"
    timeout             = 3
    unhealthy_threshold = 2
  }
}

resource "aws_autoscaling_attachment" "www-servers" {
  # checkov:skip=CKV2_AWS_15: ELB health check
  autoscaling_group_name = var.asg_id
  alb_target_group_arn   = aws_lb_target_group.www-servers.arn
  elb                    = aws_lb_target_group.www-servers.id
}