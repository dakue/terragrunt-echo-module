provider "aws" {
  region                  = "${var.AWS_REGION}"
  shared_credentials_file = "${var.AWS_SHARED_CREDENTIALS_FILE}"
  profile                 = "${var.AWS_PROFILE}"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

resource "aws_vpc" "main" {
  cidr_block = "${var.cidr_block}"
}
