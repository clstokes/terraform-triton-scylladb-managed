#
# Terraform/Providers
#
terraform {
  required_version = ">= 0.11.0"
}

provider "triton" {
  version = ">= 0.4.1"
}

#
# Data sources
#
data "triton_datacenter" "current" {}

data "triton_account" "current" {}

#
# Locals
#
locals {
  scylladb_address = "${var.role_tag}.svc.${data.triton_account.current.id}.${data.triton_datacenter.current.name}.${var.cns_fqdn_base}"
}

#
# Machines
#
resource "triton_machine" "scylladb" {
  name    = "${var.name}-scylladb"
  package = "${var.package}"
  image   = "${var.image}"

  firewall_enabled = false

  networks = ["${var.networks}"]

  tags {
    role = "${var.role_tag}"
  }

  cns {
    services = ["${var.cns_service_name}"]
  }
}
