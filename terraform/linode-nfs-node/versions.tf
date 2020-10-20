terraform {
  required_providers {
    linode = {
      source = "linode/linode"
    }
    tls = {
      source = "hashicorp/tls"
    }
  }
  required_version = ">= 0.13"
}
