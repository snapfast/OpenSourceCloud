
resource "tls_private_key" "key1" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "linode_sshkey" "use_key" {
  label   = "use_key"
  ssh_key = replace(tls_private_key.key1.public_key_openssh, "\n", "")
  # ssh_key = tls_private_key.key1.public_key_pem
}

resource "linode_instance" "ansible_master" {
  label           = "ansible_master"
  image           = "linode/centos8"
  region          = var.region
  type            = "g6-standard-1"
  authorized_keys = [linode_sshkey.use_key.ssh_key]
  root_pass       = var.vmpass

  group = "master"
  tags  = ["master"]

  # swap_size = 256
  private_ip = true
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y", 
      "sudo yum install python3 python3-pip -y", 
      "pip3 install ansible -y", 
      "ansible --version"]
    connection {
      type     = "ssh"
      host     = self.ip_address
      user     = var.vmuser
      password = var.vmpass
    }
  }
}

resource "linode_instance" "ansible-node" {
  count           = var.node_count
  label           = "ansible_instance_${count.index}"
  image           = "linode/centos8"
  region          = var.region
  type            = "g6-standard-1"
  authorized_keys = [linode_sshkey.use_key.ssh_key]
  root_pass       = var.vmpass

  group = "new-node"
  tags  = ["node"]

  # swap_size = 256
  private_ip = true
  provisioner "remote-exec" {
    inline = ["sudo yum update -y", "sudo yum install python3 -y"]
    connection {
      type     = "ssh"
      host     = self.ip_address
      user     = var.vmuser
      password = var.vmpass
    }
  }
}



