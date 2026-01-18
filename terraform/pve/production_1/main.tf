terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

module "production_1_ubuntu_vm" {
  source          = "../../modules/virtual-machine/ubuntu"
  name            = "production-ubuntu-vm"
  target_node     = var.target_node
  vmid            = 1202
  ssh_public_keys = var.ssh_public_keys
  network_ip      = "10.31.101.202/16"
  password        = var.user_password
}

module "production_1_alpine_vm" {
  source          = "../../modules/virtual-machine/alpine"
  name            = "production-alpine-vm"
  target_node     = var.target_node
  vmid            = 1203
  ssh_public_keys = var.ssh_public_keys
  network_ip      = "10.31.101.203/16"
  password        = var.user_password
}
