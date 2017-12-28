---
title: Subnets
weight: 200
---

Creates a number of subnets and divides them in different parts based on the input params

## Available variables

* [`cidr`]: String(required): the CIDR to be divided into subnets  
* [`newbits`]: String(optional): default to 8. For details see https://www.terraform.io/docs/configuration/interpolation.html#cidrsubnet_iprange_newbits_netnum_
* [`netnum`]: String(optional): default to 0. First number of subnet to start of (ex I want a 10.1,10.2,10.3 subnet I specify 1)
* [`vpc_id`]: String(required): the VPC ID where we want to create the subnets
* [`role`]: String(required): the role of the subnets. Example values are `lb`, `db` and `app`.
* [`visibility`]: String(required): the visibility of the subnets. Valid values are `public` and `private`
* [`tags`]: Map(optional): optional tags
* [`project`]: String(required): the name of the project these subnets belong to
* [`environment`]: String(required): the name of the environment these subnets belong to (prod,stag,dev)
* [`num_subnets`]: String(optional): default to 3. the number of subnets we want to create
* [`route_tables`]: List(optional): the list of route tables to associate to the created subnet. This will associate the route table to the created subnet sequentially. If the subnet number is greater than the number of route tables, the route table will be selected sing a standard mod algorithm
* [`num_route_tables`]: String(optional): default to 0. the number of route tables passed in route_tables. NOTE: this is due to a bug in terraform that cannot iterate over count param

## Output

* [`ids`]: List: the ids of the subnets created

## Example

```hcl
module "public_lb_subnets" {
  source             = "../subnets"
  num_subnets        = "${var.amount_public_lb_subnets}"
  visibility         = "public"
  role               = "lb"
  cidr               = "${var.cidr_block}"
  netnum             = 0
  vpc_id             = "${aws_vpc.main.id}"
  aws_region         = "${var.aws_region}"
  environment        = "${var.environment}"
  project            = "${var.project}"
  tags               = { "KubernetesCluster" = "test" }
}
```
