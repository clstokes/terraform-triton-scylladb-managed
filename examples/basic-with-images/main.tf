#
# Data Sources
#
data "triton_image" "ubuntu" {
  name        = "ubuntu-16.04"
  type        = "lx-dataset"
  most_recent = true
}

data "triton_image" "scylladb" {
  name        = "ScyllaDB-Managed"
  type        = "zvol"
  most_recent = true
}

data "triton_network" "public" {
  name = "Joyent-SDC-Public"
}

data "triton_network" "private" {
  name = "My-Fabric-Network"
}

#
# Modules
#
module "bastion" {
  source = "github.com/joyent/terraform-triton-bastion"

  name    = "scylladb-basic-with-images"
  image   = "${data.triton_image.ubuntu.id}" # note: using the UBUNTU image here
  package = "g4-general-4G"

  # Public and Private
  networks = [
    "${data.triton_network.public.id}",
    "${data.triton_network.private.id}",
  ]
}

module "scylladb" {
  source = "../../"

  name    = "scylladb-basic-with-images"
  image   = "${data.triton_image.scylladb.id}" # note: using the ScyllaDB image here
  package = "k4-highcpu-kvm-7.75G"

  # Public and Private
  networks = [
    "${data.triton_network.private.id}",
  ]

  bastion_role_tag = "${module.bastion.bastion_role_tag}"
}
