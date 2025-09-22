terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc04"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_token_id
  pm_api_token_secret = var.proxmox_token_secret
  pm_tls_insecure     = true
}

module "development_1" {
  source          = "./pve/development_1"
  ssh_public_keys = var.ssh_public_keys
  user_password   = var.user_password
  target_node     = var.development_target_node
}

module "staging_1" {
  source          = "./pve/staging_1"
  ssh_public_keys = var.ssh_public_keys
  user_password   = var.user_password
  target_node     = var.staging_target_node
}

# Generate Ansible inventory from Terraform outputs
resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tpl", {
    development_1_virtualization_results = module.development_1.virtualization_results
    staging_1_virtualization_results     = module.staging_1.virtualization_results
  })
  filename = "${path.module}/../ansible/inventories/virtualization/hosts.ini"
}
