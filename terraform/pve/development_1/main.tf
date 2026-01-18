terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

# module "development_1_ubuntu" {
#   source          = "../../modules/container/ubuntu"
#   hostname        = "development-ubuntu"
#   ssh_public_keys = var.ssh_public_keys
#   network_ip      = "10.31.103.100/16"
#   target_node     = var.target_node
#   user_password   = var.user_password
#   vmid            = 3100
# }

# module "development_1_alpine" {
#   source          = "../../modules/container/alpine"
#   hostname        = "development-alpine"
#   ssh_public_keys = var.ssh_public_keys
#   network_ip      = "10.31.103.101/16"
#   target_node     = var.target_node
#   user_password   = var.user_password
#   vmid            = 3101
# }

# module "development_1_debian" {
#   source          = "../../modules/container/debian"
#   hostname        = "development-debian"
#   ssh_public_keys = var.ssh_public_keys
#   network_ip      = "10.31.103.102/16"
#   target_node     = var.target_node
#   user_password   = var.user_password
#   vmid            = 3102
# }
