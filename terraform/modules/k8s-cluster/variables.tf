variable "cluster_name" {
  type        = string
  description = "Name of the Kubernetes cluster"
}

variable "target_node" {
  type        = string
  description = "Target Proxmox node name"
  default     = "shvets"
}

variable "template_id" {
  type        = number
  description = "ID of the existing Proxmox template to clone from"
}

variable "storage_pool" {
  type        = string
  description = "Storage pool for VM disks"
  default     = "local-lvm"
}

variable "network_bridge" {
  type        = string
  description = "Network bridge for VMs"
  default     = "vmbr0"
}

# Master node configuration
variable "master_count" {
  type        = number
  description = "Number of master nodes"
  default     = 2
}
variable "master_vmid_start" {
  type        = number
  description = "Starting VM ID for master nodes"
}

variable "master_cores" {
  type        = number
  description = "Number of CPU cores for master nodes"
  default     = 1
}

variable "master_memory" {
  type        = number
  description = "Memory size in MB for master nodes"
  default     = 2048
}

variable "master_disk_size" {
  description = "Disk size for master nodes (e.g., '32G', '1T')"
  type        = string
  default     = "16G"
}

# Worker node configuration
variable "worker_count" {
  type        = number
  description = "Number of worker nodes"
  default     = 4
}
variable "worker_vmid_start" {
  type        = number
  description = "Starting VM ID for worker nodes"
}

variable "worker_cores" {
  type        = number
  description = "Number of CPU cores for worker nodes"
  default     = 2
}

variable "worker_memory" {
  type        = number
  description = "Memory size in MB for worker nodes"
  default     = 4096
}

variable "worker_disk_size" {
  description = "Disk size for worker nodes (e.g., '32G', '1T')"
  type        = string
  default     = "32G"
}
