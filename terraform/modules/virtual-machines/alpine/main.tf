terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  desc        = var.description
  name        = var.name
  target_node = var.target_node
  vmid        = var.vmid
  cores       = var.cores
  sockets     = 1
  cpu         = "host"
  memory      = var.memory
  scsihw      = "virtio-scsi-pci"
  disk {
    type    = "scsi"
    storage = var.storage_pool
    size    = var.disk_size
    ssd     = 1
  }
  network {
    bridge = var.network_bridge
    model  = "virtio"
  }
  agent   = 1
  os_type = "l26"
  boot    = "order=scsi0;ide2;net0"
  lifecycle {
    ignore_changes = [
      network[0].macaddr,
    ]
  }
}
