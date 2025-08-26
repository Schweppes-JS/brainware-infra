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
}

variable "cores" {
  type        = number
  description = "Number of CPU cores"
}

variable "disk_size" {
  type        = string
  description = "Disk size"
}

variable "template_id" {
  type        = number
  description = "ID of the existing Proxmox template to clone from"
}
