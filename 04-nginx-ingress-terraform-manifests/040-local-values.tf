# Define Local Values in Terraform
locals {
  owners = var.author
  environment = var.environment
  name = "${var.application}-${var.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
    application = local.name
  }
} 