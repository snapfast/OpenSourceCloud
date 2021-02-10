
resource "tls_private_key" "key1" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "linode_sshkey" "use_key" {
  label   = "use_key"
  ssh_key = replace(tls_private_key.key1.public_key_openssh, "\n", "")
  # ssh_key = tls_private_key.key1.public_key_pem
}

data "linode_stackscript" "script1" {
  id = 676681
}

resource "linode_instance" "apache1" {
  count           = var.node_count
  label           = "simple_instance_${count.index}"
  image           = "linode/ubuntu20.04"
  region          = var.region
  type            = "g6-standard-1"
  authorized_keys = [linode_sshkey.use_key.ssh_key]
  root_pass       = "terr4form-test"

  group = "new-node"
  tags  = ["prod"]

  /*
  */

  stackscript_id = data.linode_stackscript.script1.id

  # swap_size = 256
  private_ip = true
  /*
  provisioner "remote-exec" {
    inline = ["apt update", "apt install apache2"]
    connection {
      type     = "ssh"
      host     = self.ip_address
      user     = var.vmuser
      password = var.vmpass
    }
  }*/
}

resource "linode_nodebalancer" "new1" {
  label  = "nameofLB"
  region = var.region
}

resource "linode_nodebalancer_config" "new1config" {
  nodebalancer_id = linode_nodebalancer.new1.id
  port            = 80
  protocol        = "http"
  check           = "http"
  check_path      = "/var/www/html/"
  check_attempts  = 3
  check_timeout   = 30
  stickiness      = "http_cookie"
  algorithm       = "source"
}

resource "linode_nodebalancer_node" "lb_node" {
  count           = var.node_count
  nodebalancer_id = linode_nodebalancer.new1.id
  config_id       = linode_nodebalancer_config.new1config.id
  label           = "nodelb-${count.index + 1}"
  address         = "${element(linode_instance.apache1.*.private_ip_address, count.index)}:80"
  # mode            = accept
}

/*


resource "linode_firewall" "firewall_security" {
  depends_on = [linode_instance.apache1]

  label = "firewall1"
  tags  = ["prod"]

  inbound {
    protocol  = "TCP"
    ports     = ["80"]
    addresses = ["0.0.0.0/0"]
  }

  outbound {
    protocol  = "TCP"
    ports     = ["80"]
    addresses = ["0.0.0.0/0"]
  }

  linodes = [linode_instance.apache1.id]

}


output "lb_address" {
  value = "${aws_alb.web.public_dns}"
}

*/




