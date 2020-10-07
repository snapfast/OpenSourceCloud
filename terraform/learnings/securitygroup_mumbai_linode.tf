

resource "linode_firewall" "firewall_security" {
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

  linodes = [linode_instance.webserver1.id]
}

