variable "cluster_name" {
  type        = string
  description = "Name of the Kubernetes cluster"
  default     = "k8s-cluster"
}

variable "target_node" {
  type        = string
  description = "Target Proxmox node name"
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
variable "master_vmid_start" {
  type        = number
  description = "Starting VM ID for master nodes"
  default     = 100
}

variable "master_cores" {
  type        = number
  description = "Number of CPU cores for master nodes"
  default     = 2
}

variable "master_memory" {
  type        = number
  description = "Memory size in MB for master nodes"
  default     = 4096
}

variable "master_disk_size" {
  type        = string
  description = "Disk size for master nodes"
  default     = "32G"
}

# Worker node configuration
variable "worker_vmid_start" {
  type        = number
  description = "Starting VM ID for worker nodes"
  default     = 110
}

variable "worker_cores" {
  type        = number
  description = "Number of CPU cores for worker nodes"
  default     = 4
}

variable "worker_memory" {
  type        = number
  description = "Memory size in MB for worker nodes"
  default     = 8192
}

variable "worker_disk_size" {
  type        = string
  description = "Disk size for worker nodes"
  default     = "64G"
}

# Load balancer configuration
variable "create_load_balancer" {
  type        = bool
  description = "Whether to create a load balancer for master nodes"
  default     = true
}

variable "lb_vmid" {
  type        = number
  description = "VM ID for load balancer"
  default     = 120
}

variable "lb_cores" {
  type        = number
  description = "Number of CPU cores for load balancer"
  default     = 1
}

variable "lb_memory" {
  type        = number
  description = "Memory size in MB for load balancer"
  default     = 1024
}

variable "lb_disk_size" {
  type        = string
  description = "Disk size for load balancer"
  default     = "16G"
}
