variable "name" {
  type        = string
  description = "Name of the VM"
}

variable "target_node" {
  type        = string
  description = "Target Proxmox node name"
}

variable "vmid" {
  type        = number
  description = "VM ID for the new VM"
}

variable "memory" {
  type        = number
  description = "Memory size in MB"
  default     = 512
}

variable "cores" {
  type        = number
  description = "Number of CPU cores"
  default     = 1
}

variable "disk_size" {
  description = "Disk size for the VM (e.g., '32G', '1T')"
  type        = string
  default     = "4G"
}

variable "template_id" {
  type        = number
  description = "ID of the existing Proxmox template to clone from"
  default     = "local:vztmpl/alpine-standard-3.22.1-x86_64.iso"
}

variable "storage_pool" {
  type        = string
  description = "Storage pool to use for the VM"
  default     = "local-lvm"
}

variable "network_bridge" {
  type        = string
  description = "Network bridge to use for the VM"
  default     = "vmbr0"
}

variable "description" {
  description = "Description for the VM"
  type        = string
  default     = "Alpine 3.22 VM"
}

# Cloud-init variables for IP configuration
variable "ciuser" {
  description = "Cloud-init user"
  type        = string
  default     = "schweppes"
}

variable "cipassword" {
  description = "Cloud-init password"
  type        = string
  sensitive   = true
}

variable "ssh_public_keys" {
  description = "SSH public keys for cloud-init"
  type        = string
}

variable "static_ip" {
  description = "Static IP address for the VM (e.g., '192.168.1.100/24')"
  type        = string
}

variable "gateway" {
  description = "Gateway IP address"
  default     = "192.168.31.1"
  type        = string
}
