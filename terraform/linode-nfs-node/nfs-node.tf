/*
resource "tls_private_key" "key1" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
*/

resource "linode_sshkey" "use_key" {
  label = "use_key"
  # ssh_key = replace(tls_private_key.key1.public_key_openssh, "\n", "")
  ssh_key = chomp(file("~/.ssh/id_rsa.pub"))
}



resource "linode_instance" "network-file-system" {
  label           = "nfs_master"
  image           = "linode/centos8"
  region          = var.region
  type            = "g6-standard-1"
  authorized_keys = [linode_sshkey.use_key.ssh_key]
  root_pass       = var.vmpass

  group = "nfs"
  tags  = ["nfs"]

  # swap_size = 256
  private_ip = true
  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nfs-utils -y",
      "sudo systemctl start nfs-server.service",
      "sudo systemctl enable nfs-server.service",
      "sudo systemctl status nfs-server.service --no-pager",
      "sudo mkdir -p /srv/nfs/kubedata",
      "sudo chmod -R 777 /srv/nfs",
      "echo '/srv/nfs/kubedata  *(rw,sync,no_subtree_check,insecure)' >> /etc/exports",
      "sudo exportfs -rav",
      "sudo exportfs -v",
      "showmount -e",
    ]
    connection {
      type     = "ssh"
      host     = self.ip_address
      user     = var.vmuser
      password = var.vmpass
    }
  }
}
