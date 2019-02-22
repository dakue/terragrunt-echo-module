provider "aws" {
  region                  = "${var.AWS_REGION}"
  shared_credentials_file = "${var.AWS_SHARED_CREDENTIALS_FILE}"
  profile                 = "${var.AWS_PROFILE}"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

module "vpc" {
  source = "git@github.com:terraform-aws-modules/terraform-aws-vpc.git//?ref=master"

  name = "simple-example-${var.cidr_block_start}"

  cidr = "${var.cidr_block_start}.0.0.0/16"

  azs             = ["${var.AWS_REGION}a", "${var.AWS_REGION}b", "${var.AWS_REGION}c"]
  private_subnets = ["${var.cidr_block_start}.0.1.0/24", "${var.cidr_block_start}.0.2.0/24", "${var.cidr_block_start}.0.3.0/24"]
  public_subnets  = ["${var.cidr_block_start}.0.101.0/24", "${var.cidr_block_start}.0.102.0/24", "${var.cidr_block_start}.0.103.0/24"]

  assign_generated_ipv6_cidr_block = true

  enable_nat_gateway = true
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  tags = {
    env = "simple-example-${var.cidr_block_start}"
  }

  vpc_tags = {}
}
