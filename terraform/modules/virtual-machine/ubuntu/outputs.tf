output "vm_name" {
  description = "Name of the created VM"
  value       = proxmox_vm_qemu.vm.name
}

output "vm_vmid" {
  description = "VM ID of the VM"
  value       = proxmox_vm_qemu.vm.vmid
}

output "vm_ip" {
  description = "IP address of the VM"
  value       = proxmox_vm_qemu.vm.default_ipv4_address
}
