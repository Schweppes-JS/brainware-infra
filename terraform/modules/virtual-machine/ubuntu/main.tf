# terraform {
#   required_providers {
#     proxmox = {
#       source = "Telmate/proxmox"
#     }
#   }
# }

# resource "proxmox_vm_qemu" "vm" {
#   desc        = "VM created with Terraform from template"
#   name        = var.name
#   target_node = var.target_node
#   vmid        = var.vmid
#   clone       = var.template_id
#   cores       = var.cores
#   sockets     = 1
#   cpu         = "host"
#   memory      = var.memory
#   scsihw      = "virtio-scsi-pci"
#   disk {
#     type    = "scsi"
#     storage = var.storage_pool
#     size    = var.disk_size
#     ssd     = 1
#   }
#   network {
#     bridge = var.network_bridge
#     model  = "virtio"
#   }
#   agent   = 1
#   os_type = "l26"
#   boot    = "order=scsi0;ide2;net0"
#   lifecycle {
#     ignore_changes = [
#       network[0].macaddr,
#     ]
#   }
# }
