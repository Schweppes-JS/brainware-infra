variable "name" {
  type        = string
  description = "Name of the VM"
}

variable "description" {
  type        = string
  description = "Description of the VM"
  default     = "Ubuntu 22.04 VM"
}

variable "target_node" {
  type        = string
  description = "Target Proxmox node name"
}

variable "vmid" {
  type        = number
  description = "VM ID for the new VM"
  validation {
    condition     = var.vmid >= 100
    error_message = "VM ID must be greater than 100"
  }
}

variable "memory" {
  type        = number
  description = "Memory size in MB"
  default     = 2048
}

variable "cores" {
  type        = number
  description = "Number of CPU cores"
  default     = 1
}

variable "template_id" {
  type        = number
  description = "ID of the existing Proxmox template to clone from"
  default     = 100
}

variable "disk_size_gb" {
  description = "Disk size in GB (used for SCSI disk)"
  type        = number
  default     = 8
}

variable "storage_pool" {
  type        = string
  description = "Storage pool to use for the VM"
  default     = "ceph-osd"
}

variable "network_bridge" {
  type        = string
  description = "Network bridge to use for the VM"
  default     = "vmbr0"
}

variable "ssh_public_keys" {
  type        = string
  description = "List of SSH public keys to add to the VM"
}

variable "username" {
  type        = string
  description = "Default username for cloud-init"
  default     = "schweppes"
  # sensitive   = true
}

variable "password" {
  type        = string
  description = "Default password for cloud-init (leave empty for key-based auth)"
  default     = ""
  # sensitive   = true
}

variable "network_ip" {
  type        = string
  description = "Static IP address for the VM (leave empty for DHCP)"
}

variable "gateway" {
  type        = string
  description = "Gateway IP address"
  default     = "10.31.0.1"
}

variable "nameservers" {
  type        = list(string)
  description = "DNS nameservers"
  default     = ["8.8.8.8", "8.8.4.4"]
}

variable "start_on_boot" {
  type        = bool
  description = "Whether to start the VM on boot"
  default     = true
}

variable "boot_order" {
  type        = number
  description = "Boot order priority (lower number = higher priority, 0 = disabled, 999 = start last)"
  default     = 2
}
