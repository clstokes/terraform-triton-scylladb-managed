#
# Outputs
#
output "bastion_ip" {
  value = ["${module.bastion.bastion_ip}"]
}

output "scylladb_ip" {
  value = ["${module.scylladb.scylladb_ip}"]
}

output "scylladb_address" {
  value = ["${module.scylladb.scylladb_address}"]
}
