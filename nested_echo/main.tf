provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

resource "null_resource" "inventories" {
  provisioner "local-exec" {
    command = "echo  ${var.echo_string}"
  }
}

module "nested_echo" {
  source = "git@github.com:itsmethemojo/terragrunt-echo-module.git//echo"

  aws_region  = "${var.aws_region}"
  echo_string = "${var.echo_string}"
}
