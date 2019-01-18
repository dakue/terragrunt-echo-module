provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

module "nested_echo" {
  source = "git@github.com:itsmethemojo/terragrunt-echo-module.git//echo"

  aws_region  = "${var.aws_region}"
  echo_string = "${var.echo_string}"
}
