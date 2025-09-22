# terraform {
#   required_providers {
#     proxmox = {
#       source = "Telmate/proxmox"
#     }
#   }
# }

# # Master nodes
# resource "proxmox_vm_qemu" "k8s_master" {
#   name        = "${var.cluster_name}-master-${count.index + 1}"
#   desc        = "Kubernetes master node ${count.index + 1}"
#   count       = var.master_count
#   target_node = var.target_node
#   vmid        = var.master_vmid_start + count.index
#   clone       = var.template_id
#   cores       = var.master_cores
#   sockets     = 1
#   cpu         = "host"
#   memory      = var.master_memory
#   scsihw      = "virtio-scsi-pci"

#   disk {
#     type    = "scsi"
#     storage = var.storage_pool
#     size    = var.master_disk_size
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

#   tags = "k8s;master;${var.cluster_name}"
# }

# # Worker nodes
# resource "proxmox_vm_qemu" "k8s_worker" {
#   name        = "${var.cluster_name}-worker-${count.index + 1}"
#   desc        = "Kubernetes worker node ${count.index + 1}"
#   count       = var.worker_count
#   target_node = var.target_node
#   vmid        = var.worker_vmid_start + count.index
#   clone       = var.template_id
#   cores       = var.worker_cores
#   sockets     = 1
#   cpu         = "host"
#   memory      = var.worker_memory
#   scsihw      = "virtio-scsi-pci"

#   disk {
#     type    = "scsi"
#     storage = var.storage_pool
#     size    = var.worker_disk_size
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

#   tags = "k8s;worker;${var.cluster_name}"
# }
