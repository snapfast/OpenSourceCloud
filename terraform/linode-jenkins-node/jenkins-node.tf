/*
resource "tls_private_key" "key1" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
*/

resource "linode_sshkey" "use_key" {
  label   = "use_key"
  # ssh_key = replace(tls_private_key.key1.public_key_openssh, "\n", "")
  ssh_key = chomp(file("~/.ssh/id_rsa.pub"))
  # ssh_key = tls_private_key.key1.public_key_pem
}



resource "linode_instance" "jenkins_master" {
  label           = "jenkins_master"
  image           = "linode/ubuntu20.04"
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
      "sudo apt update -y",
      "sudo apt install openjdk-11-jdk -y",
      "java -version",
      "wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -",
      "sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'",
      "sudo apt update -y",
      "sudo apt install jenkins -y",
      "sleep 10",
      "cat /var/lib/jenkins/secrets/initialAdminPassword"
    ]
    connection {
      type     = "ssh"
      host     = self.ip_address
      user     = var.vmuser
      password = var.vmpass
    }
  }
}
