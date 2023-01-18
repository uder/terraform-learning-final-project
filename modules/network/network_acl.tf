# resource "aws_network_acl" "private" {
#   vpc_id     = module.vpc.vpc_id
#   subnet_ids = module.vpc.private_subnets

#   egress {
#     protocol   = "tcp"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = var.vpc_cidr
#     from_port  = 1024-65535
#     to_port    = 1024-65535
#   }

#   ingress {
#     protocol   = "tcp"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = var.vpc_cidr
#     from_port  = 80
#     to_port    = 80
#   }

#   tags = {
#     name = "${var.name_prefix}-private-nacl"
#   }
# }