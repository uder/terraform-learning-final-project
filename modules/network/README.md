## Terraform Course Final Project
 - Terraform should create a scale set of 3 instances, including external load balancer with health checks, everything should be done via terraform tf/tfstate files
 - Try to use terraform modules to segregate resources by its types (compute, network)
 - Create golden image containing pre-installed HTTP server (Apache) with simple website inside
 - Every host should display server number/hostname to ensure that load balancer is working
 - User should be able to connect to the website in HA mode via external load balancer IP
 - Add firewall for accessing external load balancer from limiter IP addresses range and only for certain ports
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.18.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_az_letters"></a> [aws\_az\_letters](#input\_aws\_az\_letters) | AWS availablility zone letters | `list(string)` | <pre>[<br>  "a",<br>  "b",<br>  "c"<br>]</pre> | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region | `string` | n/a | yes |
| <a name="input_aws_subnets_number"></a> [aws\_subnets\_number](#input\_aws\_subnets\_number) | Number of subnets in AWS VPC | `number` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Name prefix for the project | `string` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | AWS private subnets CIDRs | `list(string)` | <pre>[<br>  "10.0.0.0/24",<br>  "10.0.1.0/24",<br>  "10.0.2.0/24"<br>]</pre> | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | AWS private subnets CIDRs | `list(string)` | <pre>[<br>  "10.0.10.0/24",<br>  "10.0.11.0/24",<br>  "10.0.12.0/24"<br>]</pre> | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC CIDR | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | n/a |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS --> 