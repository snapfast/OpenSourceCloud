
output "public_ip" {
  value = ["${linode_instance.webserver1.ip_address}"]
}
output "status" {
  value = ["${linode_instance.webserver1.status}"]
}
output "disk_size" {
  value = ["${linode_instance.webserver1.specs.0.disk}"]
}
output "swap_space" {
  value = ["${linode_instance.webserver1.swap_size}"]
}

output "ssh_input" {
  value = [tls_private_key.key1.public_key_openssh, tls_private_key.key1.private_key_pem, "${tls_private_key.key1.public_key_pem}", ]
}


