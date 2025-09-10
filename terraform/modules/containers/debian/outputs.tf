output "container_id" {
  description = "ID of the created LXC container"
  value       = proxmox_lxc.ubuntu_24_04_lxc.vmid
}

output "container_name" {
  description = "Name of the created LXC container"
  value       = proxmox_lxc.ubuntu_24_04_lxc.hostname
}

output "container_ip" {
  description = "IP address of the container"
  value       = proxmox_lxc.ubuntu_24_04_lxc.network[0].ip
}
