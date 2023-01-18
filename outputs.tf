output "load_balancer_url" {
  value = "http://${module.load_balancer.dns_name}"
}
