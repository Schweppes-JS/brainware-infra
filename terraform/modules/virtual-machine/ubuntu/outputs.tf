output "vm_id" {
  description = "ID of the created VM"
  value       = proxmox_vm_qemu.ubuntu_vm.vmid
}

output "vm_name" {
  description = "Name of the created VM"
  value       = proxmox_vm_qemu.ubuntu_vm.name
}

output "vm_user_name" {
  description = "Username created in the VM"
  value       = var.username
}

