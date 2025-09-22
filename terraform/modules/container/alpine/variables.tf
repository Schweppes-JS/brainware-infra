variable "target_node" {
  description = "Target Proxmox node to create the container on"
  type        = string
}

variable "hostname" {
  description = "Hostname for the Alpine container"
  type        = string
}

variable "ostemplate" {
  description = "Alpine 3.22 template to use"
  type        = string
  default     = "local:vztmpl/alpine-3.22-default_20250617_amd64.tar.xz"
}

variable "unprivileged" {
  description = "Whether to create an unprivileged container"
  type        = bool
  default     = true
}

variable "network_bridge" {
  description = "Network bridge to use"
  type        = string
  default     = "vmbr0"
}

variable "network_ip" {
  description = "IP address for the container (CIDR notation)"
  type        = string
}

variable "network_gateway" {
  description = "Network gateway"
  type        = string
  default     = "192.168.31.1"
}

variable "storage_pool" {
  description = "Storage pool to use for the container"
  type        = string
  default     = "local-lvm"
}

variable "disk_size" {
  description = "Disk size for the container (e.g., '32G', '2T')"
  type        = string
  default     = "2G"
}

variable "cores" {
  description = "Number of CPU cores to allocate"
  type        = number
  default     = 1
}

variable "vmid" {
  description = "VM ID for the new VM"
  type        = number
}

variable "memory" {
  description = "Memory to allocate in MB"
  type        = number
  default     = 256
}

variable "swap" {
  description = "Swap memory to allocate in MB"
  type        = number
  default     = 256
}


variable "ssh_public_keys" {
  description = "SSH public keys to inject into the container (comma-separated string)"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the container (comma-separated string)"
  type        = string
  default     = "alpine,lxc"
}

variable "description" {
  description = "Description for the container"
  type        = string
  default     = "Alpine 3.22 LXC Container"
}

variable "start_on_boot" {
  description = "Whether to start the container on boot"
  type        = bool
  default     = true
}

variable "start_after_creation" {
  description = "Whether to start the container after creation"
  type        = bool
  default     = true
}

variable "boot_order" {
  description = "Boot order priority (lower number = higher priority, 0 = disabled, 999 = start last)"
  type        = number
  default     = 999
}

variable "user_name" {
  description = "Name for the user"
  default     = "schweppes"
  type        = string
  sensitive   = true
}

variable "user_password" {
  description = "Password for the user"
  type        = string
  sensitive   = true
}
