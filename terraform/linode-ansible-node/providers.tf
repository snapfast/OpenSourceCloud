terraform {
  required_providers {
    linode = {
      # The "hashicorp" namespace is the new home for the HashiCorp-maintained
      # provider plugins.
      #
      # source is not required for the hashicorp/* namespace as a measure of
      # backward compatibility for commonly-used providers, but recommended for
      # explicitness.
      source  = "linode/linode"
      version = "~> 1.13.2"
    }
  }
}

provider "linode" {
  token = var.token
}


