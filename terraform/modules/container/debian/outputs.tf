output "container_id" {
  description = "ID of the created LXC container"
  value       = proxmox_lxc.debian_lxc.vmid
}

output "container_name" {
  description = "Name of the created LXC container"
  value       = proxmox_lxc.debian_lxc.hostname
}

output "container_ip" {
  description = "IP address of the container"
  value       = proxmox_lxc.debian_lxc.network[0].ip
}

output "container_user_name" {
  description = "Username created in the container"
  value       = var.user_name
}

output "container_vmid" {
  description = "VM ID of the container"
  value       = proxmox_lxc.debian_lxc.vmid
}
