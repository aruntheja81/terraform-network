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

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

provider "aws" {
  region = "eu-west-1"
}
