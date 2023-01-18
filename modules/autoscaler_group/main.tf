resource "aws_autoscaling_group" "asg" {
  name                      = "${var.name_prefix}-asg"
  max_size                  = var.asg_params.max_size
  min_size                  = var.asg_params.min_size
  desired_capacity          = var.asg_params.desired_size
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  vpc_zone_identifier       = var.asg_params.private_subnet_ids
  target_group_arns         = [var.target_group_arn]

  launch_configuration = aws_launch_configuration.www.name

  dynamic "tag" {
    for_each = var.default_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}