variable "hcloud_token" {}
variable "ssh_keys"     { default = ["jorzekowsky", "dkoch"] }
variable "image"        { default = "ubuntu-20.04" }
variable "location"     { default = "fsn1"}
variable "server_type"  { default = "cx11"}

terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.24.0"
    }
  }
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

# server
resource "hcloud_server" "server" {
  name        = basename(path.cwd)
  image       = var.image
  location    = var.location
  ssh_keys    = var.ssh_keys
  server_type = var.server_type
}