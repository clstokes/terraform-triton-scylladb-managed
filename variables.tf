#
# Variables
#
variable "name" {
  description = "The name of the environment."
  type        = "string"
}

variable "image" {
  description = "The image to deploy as the ScyllaDB machine(s)."
  type        = "string"
}

variable "package" {
  description = "The package to deploy as the ScyllaDB machine(s)."
  type        = "string"
}

variable "networks" {
  description = "The networks to deploy the ScyllaDB machine(s) within."
  type        = "list"
}

variable "role_tag" {
  description = "The 'role' tag for the ScyllaDB machine(s)."
  type        = "string"
  default     = "scyllaDB"
}

variable "cns_service_name" {
  description = "The ScyllaDB CNS service name. Note: this is the service name only, not the full CNS record."
  type        = "string"
  default     = "scylladb-managed"
}

variable "cns_fqdn_base" {
  description = "The fully qualified domain name base for the CNS address - e.g. 'cns.joyent.com' for Joyent Public Cloud."
  type        = "string"
  default     = "cns.joyent.com"
}

variable "client_access" {
  description = <<EOF
'From' targets to allow client access to ScyllaDB' web port - i.e. access from other VMs or public internet.
See https://docs.joyent.com/public-cloud/network/firewall/cloud-firewall-rules-reference#target
for target syntax.
EOF

  type    = "list"
  default = ["all vms"]
}

variable "bastion_role_tag" {
  description = "The 'role' tag for the ScyllaDB machine(s) to allow access FROM the Bastion machine(s)."
  type        = "string"
}
