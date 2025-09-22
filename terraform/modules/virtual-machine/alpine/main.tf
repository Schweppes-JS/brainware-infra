terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "alpine_vm" {
  target_node = var.target_node
  desc        = var.description
  name        = var.name
  vmid        = var.vmid
  cores       = var.cores
  memory      = var.memory
  sockets     = 1
  cpu         = "host"
  scsihw      = "virtio-scsi-pci"
  disk {
    storage = var.storage_pool
    size    = var.disk_size
    type    = "scsi"
    discard = "on"
    ssd     = 1
  }
  network {
    bridge = var.network_bridge
    model  = "virtio"
  }
  ciuser     = var.ciuser
  cipassword = var.cipassword
  sshkeys    = var.ssh_public_keys
  cicustom = var.static_ip != "" ? "user=local:snippets/static-ip-${var.name}.yml" : ""

  agent   = 1
  os_type = "l26"
  boot    = "order=scsi0;ide2;net0"
  lifecycle {
    ignore_changes = [
      network[0].macaddr,
    ]
  }
}
