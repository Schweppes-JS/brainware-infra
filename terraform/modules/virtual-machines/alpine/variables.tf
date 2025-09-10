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
  default     = 1024
}

variable "cores" {
  type        = number
  description = "Number of CPU cores"
  default     = 1
}

variable "disk_size" {
  description = "Disk size for the VM (e.g., '32G', '1T')"
  type        = string
  default     = "8G"
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
