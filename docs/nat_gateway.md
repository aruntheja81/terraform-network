---
title: NAT Gateway
weight: 300
---

Creates a nat gateway and automatically adds a route table to the route tables passed as parameter

## Available variables

* [`private_route_tables`]: List(required): List of private route tables that require the nat gateway [NOTE the number of nat gateways should match the number of private routes]
* [`number_nat_gateways`]: String(optional):  Number of nat gateways required
* [`public_subnets`]: List(required): The subnets where we are going to create/deploy the NAT gateways

## Output

* [`ids`]: List: The ids of the nat gateways created.

## Example

```hcl
module "nat_gateway" {
  source = "nat_gateway"
  private_route_tables="${module.vpc.private_rts}"
  public_subnets="${module.vpc.public_subnets}"
}
```
