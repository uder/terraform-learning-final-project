## Terraform Course Final Project
 - Terraform should create a scale set of 3 instances, including external load balancer with health checks, everything should be done via terraform tf/tfstate files
 - Try to use terraform modules to segregate resources by its types (compute, network)
 - Create golden image containing pre-installed HTTP server (Apache) with simple website inside
 - Every host should display server number/hostname to ensure that load balancer is working
 - User should be able to connect to the website in HA mode via external load balancer IP
 - Add firewall for accessing external load balancer from limiter IP addresses range and only for certain ports
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.49.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_autosacler_group"></a> [autosacler\_group](#module\_autosacler\_group) | ./modules/autoscaler_group | n/a |
| <a name="module_load_balancer"></a> [load\_balancer](#module\_load\_balancer) | ./modules/load_balancer | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_client_cidr"></a> [allow\_client\_cidr](#input\_allow\_client\_cidr) | Network with trusted clients | `string` | `"0.0.0.0/0"` | no |
| <a name="input_ami_owner_account_id"></a> [ami\_owner\_account\_id](#input\_ami\_owner\_account\_id) | Account ID owns AMI | `string` | `"565143587686"` | no |
| <a name="input_asg_desired_size"></a> [asg\_desired\_size](#input\_asg\_desired\_size) | Autoscaler group min size | `number` | `3` | no |
| <a name="input_asg_max_size"></a> [asg\_max\_size](#input\_asg\_max\_size) | Autoscaler group max size | `number` | `6` | no |
| <a name="input_asg_min_size"></a> [asg\_min\_size](#input\_asg\_min\_size) | Autoscaler group min size | `number` | `3` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region | `string` | `"us-west-2"` | no |
| <a name="input_aws_subnets_number"></a> [aws\_subnets\_number](#input\_aws\_subnets\_number) | Number of subnets in AWS VPC | `number` | `3` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Common projects tags | `map(string)` | <pre>{<br>  "Environment": "test",<br>  "Learning": "true",<br>  "Terraform": "true"<br>}</pre> | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | AWS Instance type | `string` | `"t2.micro"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Name prefix for the project | `string` | `"terraform-learning"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | VPC CIDR | `string` | `"10.0.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_load_balancer_url"></a> [load\_balancer\_url](#output\_load\_balancer\_url) | n/a |
<!-- END_TF_DOCS --> 