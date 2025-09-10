terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

resource "proxmox_lxc" "ubuntu_24_04_lxc" {
  target_node     = var.target_node
  hostname        = var.hostname
  ostemplate      = var.ostemplate
  unprivileged    = var.unprivileged
  cores           = var.cores
  memory          = var.memory
  swap            = var.swap
  ssh_public_keys = var.ssh_public_keys
  tags            = var.tags
  description     = var.description
  onboot          = var.start_on_boot
  start           = var.start_after_creation
  startup         = var.boot_order
  network {
    name   = "eth0"
    bridge = var.network_bridge
    ip     = var.network_ip
    gw     = var.network_gateway
  }
  rootfs {
    storage = var.storage_pool
    size    = var.disk_size
  }
}
