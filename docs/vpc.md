---
title: VPC
weight: 100
---

This module will create a vpc with the option to specify 4 types of subnets:

* public_nat-bastion_subnets
* public_lb_subnets
* private_app_subnets
* private_db_subnets

It will also create the required route tables for the private subnets. The private_app and private_db subnets are private subnets.

## Available variables

* [`cidr_block`]: String(required): the CIDR of the new VPC
* [`amount_public_nat-bastion_subnets`]: String(optional): default to 3. the amount of public_nat-bastion subnets required
* [`amount_public_lb_subnets`]: String(optional): default to 3. the amount of public_lb subnets required
* [`amount_private_app_subnets`]: String(optional): default to 3. the amount of private_app subnets required
* [`amount_private_db_subnets`]: String(optional): default to 3. the amount of private_db subnets required
* [`environment`]: String(required): the name of the environment these subnets belong to (prod,stag,dev)
* [`project`]: String(required): the name of the project these subnets belong to
* [`number_private_rt`]: String(optional): default to 1. the desired number of private route tables. In case we want one per AZ we can change this value.
* [`netnum_public_nat-bastion`]: String(optional): default to 0. First number of subnet to start of for public_nat-bastion subnets
* [`netnum_public_lb`]: String(optional): default to 10. First number of subnet to start of for public_lb subnets
* [`netnum_private_app`]: String(optional): default to 20. First number of subnet to start of for private_app subnets
* [`netnum_private_db`]: String(optional): default to 30. First number of subnet to start of for private_db subnets
* [`tags`]: Map(optional): optional tags

## Output

* [`vpc_id`]: String: the id of the vpc created
* [`public_nat-bastion`]: List: list of the public_nat-bastion subnets id created
* [`public_lb_subnets`]: List: list of the public_lb subnets id created
* [`private_app_subnets`]: List: list of the private_app subnets id created
* [`private_db_subnets`]: List: list of the private_db subnets id created
* [`base_sg`]: String: id of the security group created
* [`private_rts`]:  List: list of the ids of the private route tables created

## Example

```hcl
module "vpc" {
  source      = "vpc"
  cidr_block  = "172.16.0.0/16"
  project     = "test"
  environment = "prod"
  tags        = { "KubernetesCluster" = "test" }
}
```

## Migration

### From v2 to v3

The Terraform state migration commands to migrate from VPC module v2.x to v3.0 and up.

```hcl
terraform state mv module.vpc.aws_route_table_association.public_nat-bastion_hosts module.vpc.module.public_nat-bastion_subnets.aws_route_table_association.subnet_association
terraform state mv module.vpc.aws_route_table_association.private_app[0] module.vpc.module.private_app_subnets.aws_route_table_association.subnet_association[0]
terraform state mv module.vpc.aws_route_table_association.private_app[1] module.vpc.module.private_app_subnets.aws_route_table_association.subnet_association[1]
terraform state mv module.vpc.aws_route_table_association.private_app[2] module.vpc.module.private_app_subnets.aws_route_table_association.subnet_association[2]
terraform state mv module.vpc.aws_route_table_association.private_management[0] module.vpc.module.private_management_subnets.aws_route_table_association.subnet_association[0]
terraform state mv module.vpc.aws_route_table_association.private_management[1] module.vpc.module.private_management_subnets.aws_route_table_association.subnet_association[1]
terraform state mv module.vpc.aws_route_table_association.private_management[2] module.vpc.module.private_management_subnets.aws_route_table_association.subnet_association[2]
terraform state mv module.vpc.aws_route_table_association.public_lb_hosts[0] module.vpc.module.public_lb_subnets.aws_route_table_association.subnet_association[0]
terraform state mv module.vpc.aws_route_table_association.public_lb_hosts[1] module.vpc.module.public_lb_subnets.aws_route_table_association.subnet_association[1]
terraform state mv module.vpc.aws_route_table_association.public_lb_hosts[2] module.vpc.module.public_lb_subnets.aws_route_table_association.subnet_association[2]
terraform state mv module.vpc.aws_route_table_association.private_db[0] module.vpc.module.private_db_subnets.aws_route_table_association.subnet_association[0]
terraform state mv module.vpc.aws_route_table_association.private_db[1] module.vpc.module.private_db_subnets.aws_route_table_association.subnet_association[1]
terraform state mv module.vpc.aws_route_table_association.private_db[2] module.vpc.module.private_db_subnets.aws_route_table_association.subnet_association[2]
```
