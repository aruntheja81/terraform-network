module "vpc" {
  source      = "../../../"
  cidr_block  = "${var.cidr_block}"
  project     = "test"
  environment = "prod"

  tags = {
    "KubernetesCluster" = "test"
  }
}

variable "cidr_block" {
  type        = "string"
  description = "the vpc cidr block"
}

output "public_nat-bastion" {
  value = "${module.vpc.public_nat-bastion}"
}

provider "aws" {
  region = "eu-west-1"
}
