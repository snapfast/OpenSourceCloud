
resource "tls_private_key" "key1" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "linode_sshkey" "use_key" {
  label   = "use_key"
  ssh_key = replace(tls_private_key.key1.public_key_openssh, "\n", "")
  # ssh_key = tls_private_key.key1.public_key_pem
}

resource "linode_instance" "webserver1" {
  label  = "simple_instance"
  image  = "linode/ubuntu18.04"
  region = "ap-west"
  type   = "g6-standard-1"
  authorized_keys = ["${linode_sshkey.use_key.ssh_key}"]
  root_pass = "terr4form-test"

  group = "new-node"
  tags  = ["webserver"]
  # swap_size = 256
  private_ip = true
}

/*


output "lb_address" {
  value = "${aws_alb.web.public_dns}"
}

*/




