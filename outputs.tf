#
# Outputs
#
output "scylladb_ip" {
  value = ["${triton_machine.scylladb.*.primaryip}"]
}

output "scylladb_role_tag" {
  value = "${var.role_tag}"
}

output "scylladb_address" {
  value = "${local.scylladb_address}"
}
