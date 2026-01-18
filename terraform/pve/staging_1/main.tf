terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

# module "staging_1_ubuntu" {
#   source          = "../../modules/container/ubuntu"
#   hostname        = "staging-ubuntu"
#   ssh_public_keys = var.ssh_public_keys
#   network_ip      = "10.31.102.100/16"
#   target_node     = var.target_node
#   user_password   = var.user_password
#   vmid            = 2100
# }

# module "staging_1_alpine" {
#   source          = "../../modules/container/alpine"
#   hostname        = "staging-alpine"
#   ssh_public_keys = var.ssh_public_keys
#   network_ip      = "10.31.102.101/16"
#   target_node     = var.target_node
#   user_password   = var.user_password
#   vmid            = 2101
# }

# module "staging_1_debian" {
#   source          = "../../modules/container/debian"
#   hostname        = "staging-debian"
#   ssh_public_keys = var.ssh_public_keys
#   network_ip      = "10.31.102.102/16"
#   target_node     = var.target_node
#   user_password   = var.user_password
#   vmid            = 2102
# }
