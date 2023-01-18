output "target_group_arn" {
  value = aws_lb_target_group.www-servers.arn
}

output "dns_name" {
  value = aws_lb.alb.dns_name
}

output "security_group_id" {
  value = aws_security_group.allow_http.id
}