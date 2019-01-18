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
