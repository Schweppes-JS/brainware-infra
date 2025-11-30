terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

module "production_1_ubuntu" {
  source          = "../../modules/container/ubuntu"
  hostname        = "production-ubuntu"
  ssh_public_keys = var.ssh_public_keys
  network_ip      = "10.31.101.100/16"
  target_node     = var.target_node
  user_password   = var.user_password
  vmid            = 1100
}

module "production_1_alpine" {
  source          = "../../modules/container/alpine"
  hostname        = "production-alpine"
  ssh_public_keys = var.ssh_public_keys
  network_ip      = "10.31.101.101/16"
  target_node     = var.target_node
  user_password   = var.user_password
  vmid            = 1101
}

module "production_1_debian" {
  source          = "../../modules/container/debian"
  hostname        = "production-debian"
  ssh_public_keys = var.ssh_public_keys
  network_ip      = "10.31.101.102/16"
  target_node     = var.target_node
  user_password   = var.user_password
  vmid            = 1102
}
