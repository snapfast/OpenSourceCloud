
output "public_ip" {
  value = [linode_instance.network-file-system.*.ip_address]
}
output "status" {
  value = [linode_instance.network-file-system.*.status]
}
