---
title: Security Groups
---

## securitygroups/all

This module creates and exposes a reusable security group called `sg-all`.

The implementation uses the separate `aws_security_group` and `aws_security_group_rule` resources
to make the creation and adaptation of security groups much more modular.

### Available variables

* [`vpc_id`]: String(required): the id of the VPC where the security group must be created
* [`project`]: String(required): the name of the customer or project
* [`environment`]: String(required): the environment to create the security group in. Examples: `staging`, `production`

### Output

* [`sg_id`]: String: the id of the security group created

### Example

```hcl
module "securitygroup_all" {
  source                           = "github.com/skyscrapers/terraform-network//securitygroups/all"
  vpc_id                           = "${module.vpc.vpc_id}"
  project                          = "${var.project}"
  environment                      = "${var.environment}"
}
```

## securitygroups/icinga_satellite

This module creates and exposes a reusable security group called `sg_icinga_satellite`, expanded
with project and environment info.

The implementation uses the separate `aws_security_group` and `aws_security_group_rule` resources
to make the creation and adaptation of security groups much more modular.

### Available variables

* [`vpc_id`]: String(required): the id of the VPC where the security group must be created
* [`project`]: String(required): the name of the customer or project
* [`environment`]: String(required): the environment to create the security group in. Examples: `staging`, `production`
* [`icinga_master_ip`]: String(required): the IP address of the Icinga master in CIDR notation.
* [`internal_sg_id`]: String(optional): The Icinga satellite will be able to access this security group through NRPE, if provided.

### Output

* [`sg_id`]: String: the id of the security group created

### Example

```hcl
module "securitygroup_icinga" {
  source                           = "github.com/skyscrapers/terraform-network//securitygroups/icinga_satellite"
  vpc_id                           = "${module.vpc.vpc_id}"
  project                          = "${var.project}"
  environment                      = "${var.environment}"
  icinga_master_ip                 = "123.234.123.234/32"
}
```

## securitygroups/puppet

This module creates and exposes a reusable security group called `sg_puppet`, expanded
with project and environment info.

The implementation uses the separate `aws_security_group` and `aws_security_group_rule` resources
to make the creation and adaptation of security groups much more modular.

### Available variables

* [`vpc_id`]: String(required): the id of the VPC where the security group must be created
* [`project`]: String(required): the name of the customer or project
* [`environment`]: String(required): the environment to create the security group in. Examples: `staging`, `production`
* [`puppet_master_ip`]: String(required): the IP address of the Puppet master in CIDR notation.

### Output:

* [`sg_id`]: String: the id of the security group created

### Example

```hcl
module "securitygroup_icinga" {
  source                           = "github.com/skyscrapers/terraform-network//securitygroups/puppet"
  vpc_id                           = "${module.vpc.vpc_id}"
  project                          = "${var.project}"
  environment                      = "${var.environment}"
  puppet_master_ip                 = "123.234.123.234/32"
}
```

## securitygroups/web_public

This module creates and exposes a reusable security group called `sg_web_public`, expanded
with project and environment info.

The implementation uses the separate `aws_security_group` and `aws_security_group_rule` resources
to make the creation and adaptation of security groups much more modular.

### Available variables

* [`vpc_id`]: String(required): the id of the VPC where the security group must be created
* [`project`]: String(required): the name of the customer or project
* [`environment`]: String(required): the environment to create the security group in. Examples: `staging`, `production`

### Output

* [`sg_id`]: String: the id of the security group created

### Example

```hcl
module "securitygroup_web_public" {
  source                           = "github.com/skyscrapers/terraform-network//securitygroups/web_public"
  vpc_id                           = "${module.vpc.vpc_id}"
  project                          = "${var.project}"
  environment                      = "${var.environment}"
}
```
